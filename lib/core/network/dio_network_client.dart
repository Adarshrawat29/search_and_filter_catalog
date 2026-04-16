import 'package:dio/dio.dart';
import 'network_client.dart';

/// Concrete implementation using Dio
/// Only this file touches Dio (Clean Architecture rule)
class DioNetworkClient implements NetworkClient {
  final Dio dio;

  DioNetworkClient(this.dio);

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response;
  }
}