library gitterapi;

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show visibleForTesting;

part 'src/abstract/version.dart';
part 'src/abstract/resource.dart';
part 'src/api_keys.dart';
part 'src/v1.dart';
part 'src/v1/user_resource.dart';
part 'src/v1/rooms_resource.dart';
part 'src/v1/messages_resource.dart';
part 'src/v1/groups_resource.dart';
part 'src/utils/auth.dart';
part 'src/errors/gitter_api_error.dart';

class GitterApi {
  final host = 'api.gitter.im';

  final ApiKeys keys;

  V1 _v1;

  V1 get v1 => _v1;

  GitterApi(this.keys) {
    _v1 = V1(this);
  }
}
