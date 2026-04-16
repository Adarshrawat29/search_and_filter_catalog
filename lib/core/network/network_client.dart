/// Abstract contract (interface) for any HTTP client
/// Data layer must call API via abstraction (not concrete Dio directly)
abstract class NetworkClient {
  Future<dynamic> get(String url);
}