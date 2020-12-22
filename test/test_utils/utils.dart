import 'dart:io';

import 'package:dotenv/dotenv.dart' as env;

/// Returns key from either .env file or from env.
String getFromEnv(String key) {
  env.load();
  return env.env[key] ?? Platform.environment[key];
}
