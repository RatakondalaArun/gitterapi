part of gitterapi;

class ApiKeys {
  final String authToken;

  const ApiKeys(this.authToken);

  /// Returns a instance of [ApiKeys]
  /// by fetching `authToken` from Environment.
  ///
  /// This looksup for `AUTH_TOKEN` env variable.
  ///
  factory ApiKeys.fromEnv() {
    return ApiKeys(String.fromEnvironment('AUTH_TOKEN'));
  }
}
