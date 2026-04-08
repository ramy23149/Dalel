import 'package:dio/dio.dart';

class ApiServiece {
  final Dio _dio;
  final String _endpoint = "https://www.googleapis.com/books/v1/volumes?q=history&filter=free-ebooks&key=AIzaSyAS9_yZA9s5HmRrY4xLN4kHRaRmPiJnBHU";
  ApiServiece(this._dio);

  Future<Map<String, dynamic>> getBooks() async {
    Response response = await _dio.get(_endpoint);
    return response.data;
  }
  Future<Map<String,dynamic>> getSpecificBooks(String query)async{
    String endpoint = "https://www.googleapis.com/books/v1/volumes?q=history+intitle:$query&filter=free-ebooks&key=AIzaSyAS9_yZA9s5HmRrY4xLN4kHRaRmPiJnBHU";
    Response response = await _dio.get(endpoint);
    return response.data;
  }
}
