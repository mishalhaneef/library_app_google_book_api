import 'package:library_api_mvvm/model/book_model/book_model.dart';

abstract class BaseApiServices {
  Future<BookModel> getNewandTrendingBooks();
  Future<BookModel> getForYouBooks();
}
