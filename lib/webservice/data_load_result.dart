class DataLoadResult<T> {
  T? data;
  LoadingError error;
  String? errorMessage;

  DataLoadResult(
      {this.data, this.error = LoadingError.NONE, this.errorMessage});

  bool isSuccessful() {
    return (error == null || error == LoadingError.NONE) && errorMessage == null;
  }
}

enum LoadingError {
  NONE,
  NO_CONNECTION,
  SERVER_REQUEST_FAILED,
  HTTP_INTERNAL_SERVER_ERROR,
}
