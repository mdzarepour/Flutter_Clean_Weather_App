class NetworkExeption implements Exception {
  final String? message;
  final int? statusCode;
  final String? directory;

  NetworkExeption([
    this.message = 'nuknow message',
    this.directory = 'unknown directory',
    this.statusCode = 000,
  ]) {
    print(message);
    print(directory);
  }
}
