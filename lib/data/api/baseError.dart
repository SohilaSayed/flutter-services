class BaseError{
  String? errorMsg;
  BaseError({required this.errorMsg});
}

class ServerError extends BaseError{
  ServerError({required super.errorMsg});
}

class NetworkError extends BaseError{
  NetworkError({required super.errorMsg});
}

class PermissionError extends BaseError{
  PermissionError({required super.errorMsg});
}