import 'package:flutter/cupertino.dart';
import 'package:library_api_mvvm/model/book_model/book_model.dart';
import 'package:library_api_mvvm/network/api_services.dart';
import 'package:library_api_mvvm/repository/book_repository.dart';

class BookProvider extends ChangeNotifier {
  bool isFetching = true;
  List<BookModel> books = [];

  late BookModel bookModel;
  BooksNetwork _bookService = BooksNetwork();

  Future<BookModel> getBooksData() async {
    try {
      bookModel = await _bookService.getBook();
      isFetching = false;
      notifyListeners();
    } catch (e) {
      isFetching = true;
      print('catch errors on notifier class');
      notifyListeners();
    }

    return bookModel;
  }
}
