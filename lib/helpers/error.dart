class Error implements Exception {
  final dynamic message;
  final dynamic prefix;

  Error([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchData extends Error {
  FetchData([String? message]) : super(message, "Error During Communication: ");
}

class BadRequest extends Error {
  BadRequest([message]) : super(message, "Invalid Request: ");
}

class Unauthorised extends Error {
  Unauthorised([message]) : super(message, "Unauthorised: ");
}

class UnprocessableEntity extends Error {
  UnprocessableEntity([message]) : super(message, "Unprocessable Entity: ");
}

class Forbidden extends Error {
  Forbidden([String? message]) : super(message, "Forbidden: ");
}

class NotFound extends Error {
  NotFound([String? message]) : super(message, "Not Found: ");
}

class RequestTimeout extends Error {
  RequestTimeout([String? message]) : super(message, "Request Timeout: ");
}

class MethodNotAllowed extends Error {
  MethodNotAllowed([String? message]) : super(message, "Method Not Allowed: ");
}

class InternalServerError extends Error {
  InternalServerError([String? message])
      : super(message, "Internal Server Error: ");
}
