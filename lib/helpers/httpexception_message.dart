class HttpExcption implements Exception {
  final String message;

  HttpExcption(this.message);

  @override
  String toString() {
    return message;
  }
}
