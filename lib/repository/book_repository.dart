import 'dart:developer';

import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/model/book_model/book_model.dart';
import 'package:library_api_mvvm/network/api_services.dart';

class BooksNetwork {
  final NetworkApiService _apiService = NetworkApiService();

  Future<BookModel> getBook() async {
    print('get boo');
    try {
     dynamic response = await _apiService.getApiResponse();
      print('response from network class $response');
      print("respoensf ${response}");
      return response = BookModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
// widget c is : jsonDecode(response)["items"][index + 1]["volumeInfo"]["industryIdentifiers"][0]["identifier"];
