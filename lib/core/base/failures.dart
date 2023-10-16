class Failure {
  final String message;

  const Failure(this.message);
}

class ServerError extends Failure {
  const ServerError(super.message);
}

class UnexpectedError extends Failure {
  UnexpectedError([String? msg]) : super(msg ?? 'Unexpected Error');
}