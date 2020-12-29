import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class Result<T> {
  /// Status code retured by server.
  final int statusCode;

  /// Status message returned by server.
  final String statusMessage;

  /// `X-RateLimit-Limit` header.
  final int maxRateLimit;

  /// `X-RateLimit-Remaining` header.
  final int remainingRateLimit;

  /// `X-RateLimit-Reset` header.
  ///
  /// Rate limit will get reset after this.
  final DateTime rateLimitReset;

  /// This is the data recieved from server.
  final T data;

  /// Error object.
  final Object error;

  /// Return if error==null.
  bool get isError => error == null;

  /// Creates a instance if [this].
  const Result({
    this.statusCode,
    this.statusMessage,
    this.maxRateLimit,
    this.remainingRateLimit,
    this.rateLimitReset,
    this.data,
    this.error,
  });

  factory Result.success({
    @required Headers headers,
    @required int statusCode,
    @required String statusMessage,
    @required T data,
  }) {
    List<String> maxRateLimit;
    List<String> remainingRateLimit;
    List<String> rateLimitReset;

    maxRateLimit = (headers['X-RateLimit-Limit'] ?? ['0']);
    remainingRateLimit = (headers['X-RateLimit-Remaining'] ?? ['0']);
    rateLimitReset = (headers['X-RateLimit-Reset'] ?? ['0']);

    return Result<T>(
      statusCode: statusCode,
      maxRateLimit: int.tryParse(maxRateLimit[0] ?? '0'),
      remainingRateLimit: int.tryParse(remainingRateLimit[0] ?? '0'),
      rateLimitReset: DateTime.fromMillisecondsSinceEpoch(
        int.tryParse(rateLimitReset[0] ?? '0'),
      ),
      data: data,
    );
  }

  factory Result.fromError({
    @required int statusCode,
    @required String statusMessage,
    @required Object error,
    T data,
  }) {
    return Result<T>(
      statusCode: statusCode,
      statusMessage: statusMessage,
      error: error,
      data: data,
    );
  }

  Result<T> copyWith({
    int statusCode,
    String statusMessage,
    int maxRateLimit,
    int remainingRateLimit,
    DateTime rateLimitReset,
    T data,
    Object error,
  }) {
    return Result<T>(
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      maxRateLimit: maxRateLimit ?? this.maxRateLimit,
      remainingRateLimit: remainingRateLimit ?? this.remainingRateLimit,
      rateLimitReset: rateLimitReset ?? this.rateLimitReset,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'Result(statusCode: $statusCode, statusMessage: $statusMessage, maxRateLimit: $maxRateLimit, remainingRateLimit: $remainingRateLimit, rateLimitReset: $rateLimitReset, data: $data, error: $error)';
  }
}
