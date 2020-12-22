import 'package:gitterapi/gitter_api.dart';
import 'package:test/test.dart';

import '../../test_utils/utils.dart';

void main() {
  group('This tests Rooms resources', () {
    final keys = ApiKeys(getFromEnv('AUTH_TOKEN'));
    final roomId = getFromEnv('ROOM_ID');

    final api = GitterApi(keys);
    final roomResource = api.v1.roomResource;

    test('Should return all the rooms current user is in as List', () async {
      final result = await roomResource.rooms();
      expect(result is List, true);
    });

    test('Should return room details from uri as Map', () async {
      final result = await roomResource.getRoomIdFrom('dart-lang/sdk');
      expect(result is Map, true);
    });

    // TODO(@RatakondalaArun): Test joinRoom()
    // TODO(@RatakondalaArun): Test banUserFromRoom()
    // TODO(@RatakondalaArun): Test updateRoom()
    // TODO(@RatakondalaArun): Test deleteRoom()

    test('Should return users in given room as List', () async {
      final result = await roomResource.getUsers(roomId, limit: 10);
      expect(result is List, true);
      expect(result.length == 10, true);
    });
  });
}
