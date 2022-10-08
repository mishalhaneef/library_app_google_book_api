import 'package:library_api_mvvm/core/api_key.dart';

class ApiEndPoint {
  static const newAndTrending =
      "https://www.googleapis.com/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest&key=$apiKey";
  static const forYou =
      "https://www.googleapis.com/books/v1/volumes?q=subject:fantasy&download=epub&orderBy=newest&key=$apiKey";
}
