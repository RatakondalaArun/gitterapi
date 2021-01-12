part of gitterapi;

class GitterApiException implements Exception {
  final String message;

  /// Original exception may contains
  final Exception originalException;

  final int statusCode;
  final String statusMessage;

  const GitterApiException(
    this.message, {
    this.originalException,
    this.statusCode,
    this.statusMessage,
  });

  factory GitterApiException.fromDio(DioError error) {
    return GitterApiException(
      error.message,
      originalException: error,
      statusCode: error?.response?.statusCode,
      statusMessage: error?.response?.statusMessage,
    );
  }
}
