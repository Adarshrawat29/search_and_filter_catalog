/// AC 11.5: Typed failures returned from repository

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String msg) : super(msg);
}

class NetworkFailure extends Failure {
  NetworkFailure(String msg) : super(msg);
}