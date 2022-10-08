import 'dart:math';

import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view/widgets/detail_screen.dart';
import 'package:library_api_mvvm/view_model/book_provider.dart';
import 'package:provider/provider.dart';

final _controller = PageController();
final _notifierScorll = ValueNotifier(0.0);

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _controller.addListener(() => _notifierScorll.value = _controller.page!);
    });
    final bookHeight = MediaQuery.of(context).size.height * 0.45;
    final bookWidth = MediaQuery.of(context).size.width * 0.6;
    final size = MediaQuery.of(context).size;
    final widget = Provider.of<BookProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(0xFFF8F3ED),
            ),
          ),
          AppBar(
            backgroundColor: const Color(0xFFF8F3ED),
            elevation: 0,
            title: const Text(
              'DelopusBooks',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          ValueListenableBuilder<double>(
              // when the page value change its also change the notifier value
              // cos we assigned that on [line 15] as _listenet function
              valueListenable: _notifierScorll,
              builder: (context, value, _) {
                return Consumer<BookProvider>(builder: (context, data, child) {
                  if (data.isFetching) {
                    return widget.circularProgress();
                  } else {
                    return PageView.builder(
                      controller: _controller,
                      itemCount: data.bookModel.items!.length,
                      itemBuilder: (context, index) {
                        final book = data.bookModel.items![index].volumeInfo!;
                        final percentage = index - value;
                        // clamp means returning num in the given lower upper limit
                        final rotation = percentage.clamp(0.0, 1.0);
                        final fixRotation = pow(rotation, 0.35);
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              sizedbox,
                              sizedbox,
                              Center(
                                  child: GestureDetector(
                                onTap: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      buildSheet(book, context),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25))),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: bookHeight,
                                      width: bookWidth,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 20,
                                              offset: Offset(5.0, 5.0),
                                              spreadRadius: 10,
                                            )
                                          ]),
                                    ),
                                    Transform(
                                      alignment: Alignment.centerLeft,
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateY(1.8 * fixRotation)
                                        ..translate(
                                            -rotation * size.width * 0.8)
                                        ..scale(1 + rotation),
                                      child: Image.network(
                                        book.imageLinks!.thumbnail!,
                                        fit: BoxFit.cover,
                                        height: bookHeight,
                                        width: bookWidth,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              const SizedBox(height: 90),
                              Center(
                                child: Opacity(
                                  opacity: 1 - rotation,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        book.title!,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'by ${book.authors![0]}',
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                });
              })
        ],
      ),
    );
  }
}
