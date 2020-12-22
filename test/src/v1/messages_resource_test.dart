import 'package:gitterapi/gitter_api.dart';
import 'package:test/test.dart';

import '../../test_utils/utils.dart';

void main() {
  group('This tests Messages resource', () {
    final keys = ApiKeys(getFromEnv('AUTH_TOKEN'));
    // final userId = getFromEnv('USER_ID');
    final roomId = getFromEnv('ROOM_ID');
    // final messageId = getFromEnv('MESSAGE_ID');

    final api = GitterApi(keys);
    final messageResource = api.v1.messageResource;
    test('Should get 10 messages from room as List', () async {
      final result = await messageResource.getMessages(roomId, limit: 10);
      expect(true, result is List);
      expect(10, result.length);
    });

    test('Should get a single message by id as Map', () async {
      final messages = await messageResource.getMessages(roomId, limit: 1);
      final messageId = messages[0]['id'];
      final result = await messageResource.getSingleMessage(roomId, messageId);
      expect(true, result is Map);
    });

    // TODO(@RatakondalaArun): sendMessage()
    // TODO(@RatakondalaArun): updateMessage()
  });
}
