import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/model/book_model/book_model.dart';
import 'package:library_api_mvvm/repository/book_repository.dart';
import 'package:library_api_mvvm/view/home/widgets/library_list.dart';
import 'package:library_api_mvvm/view/widgets/detail_screen.dart';

class BookProvider extends ChangeNotifier {
  bool isFetching = true;
  List<BookModel> books = [];
  // Section section = newAndTrending;
  late BookModel bookModel;
  final BooksNetwork _bookService = BooksNetwork();

  Future<BookModel> getForYouBooks() async {
    try {
      // section = forYou;
      bookModel = await _bookService.getForYouBooks();
      isFetching = false;
      notifyListeners();
    } catch (e) {
      isFetching = true;
      notifyListeners();
    }

    return bookModel;
  }

  Future<BookModel> getNewAndTrendingBooks() async {
    try {
      // section = newAndTrending;
      bookModel = await _bookService.getNewandTrendingBooks();
      isFetching = false;
      notifyListeners();
    } catch (e) {
      isFetching = true;
      notifyListeners();
    }

    return bookModel;
  }

// widgets provider
  Widget circularProgress() {
    return Center(
      child: SizedBox(
        height: 300,
        child: Row(
          children: const [
            SizedBox(width: 50),
            CircularProgressIndicator(color: rootColor),
          ],
        ),
      ),
    );
  }

  Widget buildHomeBooks(BookProvider value) {
    return Row(
      children: [
        const SizedBox(width: 20),
        SizedBox(
          height: 300,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: value.bookModel.items!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final book = value.bookModel.items![index].volumeInfo;
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return buildSheet(book, context);
                          },
                        );
                      },
                      child: BookBuild(book: book),
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }
}
