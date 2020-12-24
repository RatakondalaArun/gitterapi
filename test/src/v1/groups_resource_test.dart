import 'package:gitterapi/gitter_api.dart';
import 'package:test/test.dart';

import '../../test_utils/utils.dart';

void main() {
  group('This tests Groups Resources methods', () {
    final keys = ApiKeys(getFromEnv('AUTH_TOKEN'));
    // final userId = getFromEnv('USER_ID');
    // final roomId = getFromEnv('ROOM_ID');
    // final messageId = getFromEnv('MESSAGE_ID');

    final api = GitterApi(keys);
    final groupResources = api.v1.groupResource;
    test('Should get Get the groups current user is in as List', () async {
      final result = await groupResources.getGropus();
      expect(true, result is List);
    });

    test('Should get ', () async {
      final groups = await groupResources.getGropus();
      final groupId = groups[0]['id'];
      final result = await groupResources.getRooms(groupId);
      expect(true, result is List);
    });
  });
}
