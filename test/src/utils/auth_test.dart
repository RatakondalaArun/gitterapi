import 'package:gitterapi/gitter_api.dart';
import 'package:test/test.dart';

void main() {
  group('This tests AuthUtils', () {
    test('Should return WebFlowUrl', () async {
      final url = AuthUtils.getWebFlowUrl('clientId', 'redirectUrl',
          responseType: 'code');
      expect(
        url,
        'https://gitter.im/login/oauth/authorize?client_id=clientId&response_type=code&redirect_uri=redirectUrl',
      );
    });

    test('Should return tokenUrl', () {
      final url = AuthUtils.tokenUrl;
      expect(url, 'https://gitter.im/login/oauth/token');
    });

    test('Should return parasedTokenBody of type Map<String,dynamic>', () {
      final body = AuthUtils.parsetokenBody(
        clientId: 'cliendId',
        clientSecret: 'clientSecret',
        code: 'code',
        redirectUrl: 'redirectUrl',
        grandType: 'grantType',
      );
      expect(body is Map<String, dynamic>, true);
      expect(body, <String, dynamic>{
        'client_id': 'cliendId',
        'client_secret': 'clientSecret',
        'code': 'code',
        'redirect_uri': 'redirectUrl',
        'grant_type': 'grantType',
      });
    });
  });
}
