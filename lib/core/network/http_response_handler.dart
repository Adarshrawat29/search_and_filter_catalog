import 'package:dio/dio.dart';
import '../error/exceptions.dart';

//  Handles raw HTTP response
// Inspect status & convert to usable data or throw exception
class HttpResponseHandler {
  static dynamic handle(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException("Invalid status code: ${response.statusCode}");
    }
  }
}