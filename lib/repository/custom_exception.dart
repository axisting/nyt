class CustomException implements Exception {
  final String? message;
  CustomException({this.message = 'Bir şeyler ters gitti!'}) {
    //MyToastMessage(message: message);
  }

  @override
  String toString() => 'CustomException {message : $message}';
}
