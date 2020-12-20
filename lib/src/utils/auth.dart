part of gitterapi;

/// Contains utilites for Auth for gitter api.
///
/// For more info [documentation](https://developer.gitter.im/docs/authentication)
class AuthUtils {
  // Constructs and Returns authorization url
  static String getWebFlowUrl(
    String clientId,
    String redirectUrl, {
    String responseType = 'code',
  }) {
    return 'https://gitter.im/login/oauth/authorize?client_id=$clientId&response_type=$responseType&redirect_uri=$redirectUrl';
  }

  /// Returns token url
  ///
  /// Make POST request to this url to get the code.
  /// You can use [AuthUtils.parsetokenBody(...)] to construct a body
  /// for POST method.
  static String get tokenUrl => 'https://gitter.im/login/oauth/token';

  /// Returns token body
  static Map<String, dynamic> parsetokenBody({
    String clientId,
    String clientSecret,
    String redirectUrl,
    String code,
    String grandType = 'authorization_code',
  }) {
    return <String, dynamic>{
      'client_id': clientId,
      'client_secret': clientSecret,
      'code': code,
      'redirect_uri': redirectUrl,
      'grant_type': grandType,
    };
  }
}
