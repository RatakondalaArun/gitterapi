part of gitterapi;

class GitterApiException implements Exception {
  final String message;

  /// Original exception may contains
  final Exception originalException;

  /// Contains `data` and `statusCode` keys
  final Map<String, dynamic> response;

  /// Helper getter returns true if response is empty or null,
  bool get isResponseEmpty => response == null || response.isEmpty;

  GitterApiException(
    this.message, {
    this.originalException,
    this.response,
  });
}
