import 'dart:math';

import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/model/book_model.dart';

final _controller = PageController();
final _notifierScorll = ValueNotifier(0.0);

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.addListener(() => _notifierScorll.value = _controller.page!);
    });
    final bookHeight = MediaQuery.of(context).size.height * 0.45;
    final bookWidth = MediaQuery.of(context).size.width * 0.6;
    final size = MediaQuery.of(context).size;
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
                return PageView.builder(
                  controller: _controller,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    final percentage = index - value;
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
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateY(1.8 * fixRotation)
                                  ..translate(-rotation * size.width * 0.8)
                                  ..scale(1 + rotation),
                                child: Image.asset(
                                  book.image,
                                  fit: BoxFit.cover,
                                  height: bookHeight,
                                  width: bookWidth,
                                ),
                              ),
                            ],
                          )),
                          const SizedBox(height: 90),
                          Opacity(
                            opacity: 1 - rotation,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  book.title,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'by ${book.author}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
