part of gitterapi;

///
class ApiKeys {
  /// Authorization token required to connect to Gitter API.
  final String authToken;

  /// Creates a instance of [this].
  const ApiKeys(this.authToken);

  /// Returns a instance of [ApiKeys]
  /// by fetching `authToken` from Environment.
  ///
  /// This looksup for `AUTH_TOKEN` env variable.
  ///
  /// ### Parameters:
  ///
  /// - `tokenVar`: Specifies which env variable to look for token.
  /// By default it looks for AUTH_TOKEN.
  ///
  factory ApiKeys.fromEnv({String tokenVar = 'AUTH_TOKEN'}) {
    return ApiKeys(String.fromEnvironment(tokenVar));
  }
}
