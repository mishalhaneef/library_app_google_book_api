import 'package:library_api_mvvm/core/api_end_points.dart';
import 'package:library_api_mvvm/model/book_model/book_model.dart';
import 'package:library_api_mvvm/network/api_services.dart';
import 'package:library_api_mvvm/repository/base_api_services.dart';

class BooksNetwork implements BaseApiServices {
  final NetworkApiService _apiService = NetworkApiService();
  @override
  Future<BookModel> getNewandTrendingBooks() async {
    try {
      dynamic response =
          await _apiService.getApiResponse(ApiEndPoint.newAndTrending);

      return response = BookModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookModel> getForYouBooks() async {
    try {
      dynamic response = await _apiService.getApiResponse(ApiEndPoint.forYou);
      return response = BookModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
