class ResponseCode {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int AUTHORIZATION_FAILED = 900;
  static const int SUCCESSFUL = 500;
  static const int FAILED = 501;
  static const int NOT_FOUND = 502;
}

class ResponseObject {
  int id;
  Object object;

  ResponseObject({this.id: ResponseCode.NO_INTERNET_CONNECTION, required this.object});
}
