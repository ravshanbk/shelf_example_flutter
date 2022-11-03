class HttpResult {
  int statusCode;
  bool isSuccess;
  dynamic result;
  HttpResult(
      {required this.isSuccess,
      required this.result,
      required this.statusCode});
}
