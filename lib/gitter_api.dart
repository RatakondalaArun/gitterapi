/// This library provides a easy way to intract with [Gitter API](https://developer.gitter.im/docs/welcome).
///
/// This library also provides models to convert responses.
library gitterapi;

import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show visibleForTesting, required;

part 'src/abstract/resource.dart';
part 'src/abstract/version.dart';
part 'src/api_keys.dart';
part 'src/errors/gitter_api_error.dart';
part 'src/utils/auth.dart';
part 'src/v1.dart';
part 'src/v1/groups_resource.dart';
part 'src/v1/messages_resource.dart';
part 'src/v1/rooms_resource.dart';
part 'src/v1/stream_api.dart';
part 'src/v1/user_resource.dart';

/// Core instance of Gitter API.
///
/// ### Parameters
///
/// - `keys`: This takes instance of [ApiKeys] which you can use to serve
/// your access token.
///
/// Checkout the [gitter docs](https://developer.gitter.im/docs/welcome)
class GitterApi {
  /// API Host.
  final _host = 'api.gitter.im';

  /// Contains accesstoken.
  final ApiKeys _keys;

  V1 _v1;

  /// Version one of this API.
  /// This contains all the resources belongs
  /// to version 1 of gitter api.
  V1 get v1 => _v1;

  /// Creates a instance of [this]
  ///
  /// ## Parameters
  ///
  /// - `keys`: This takes instance of [ApiKeys] which you can use to serve
  /// your access token.
  ///
  /// Checkout the [gitter docs](https://developer.gitter.im/docs/welcome)
  GitterApi(this._keys) {
    _v1 = V1(this);
  }
}

/// This object wraps all the required result params from the
/// request headers.
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
  /// This will be null if there is no error.
  final Object error;

  /// You can use this to debug where excatly
  /// the error happend if any error occurs.
  final StackTrace stackTrace;

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
    this.stackTrace,
  });

  /// Creates a instance of [this].
  /// When the request is success.
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

  /// Creates a instance of this with error object.
  factory Result.fromError({
    @required int statusCode,
    @required String statusMessage,
    @required Object error,
    @required StackTrace stackTrace,
    T data,
  }) {
    return Result<T>(
      statusCode: statusCode,
      statusMessage: statusMessage,
      error: error,
      stackTrace: stackTrace,
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
