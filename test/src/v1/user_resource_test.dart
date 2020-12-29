import 'package:test/test.dart';

import 'package:gitterapi/gitter_api.dart';

import '../../test_utils/utils.dart' show getFromEnv;

void main() {
  group('This tests UserResourse class', () {
    final keys = ApiKeys(getFromEnv('AUTH_TOKEN'));
    final userId = getFromEnv('USER_ID');
    final roomId = getFromEnv('ROOM_ID');

    final api = GitterApi(keys);
    final userResource = api.v1.userResource;

    test('Should Return current user as Map using me()', () async {
      final result = await userResource.me();
      expect(result.data is Map, true);
    });

    test('Should get current rooms as List', () async {
      final result = await userResource.getRooms(userId);
      expect(result.data is List, true);
    });

    // TODO(@RatakondalaArun): hideRoom()

    test('Should get UnreadItems as Map', () async {
      final result = await userResource.getUnreadItems(userId, roomId);
      expect(result.data is Map, true);
    });

    // TODO(@RatakondalaArun): markUnReadItemsAsRead

    test('Should get Orgs as List', () async {
      final result = await userResource.getOrgs(userId);
      expect(result.data is List, true);
    });

    test('Should get Repos as List', () async {
      final result = await userResource.getRepos(userId);
      expect(result.data is List, true);
    });

    test('Should get Channels as List', () async {
      final result = await userResource.getRepos(userId);
      expect(result.data is List, true);
    });
  });
}
