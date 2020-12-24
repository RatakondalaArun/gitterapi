import 'package:gitterapi/gitter_api.dart';
import 'package:test/test.dart';

import '../../test_utils/utils.dart';

void main() async {
  final keys = ApiKeys(getFromEnv('AUTH_TOKEN'));
  // final roomId = getFromEnv('ROOM_ID');
  final chatRoomId = getFromEnv('CHAT_ROOM_ID');

  final api = GitterApi(keys);
  final streamApi = api.v1.streamApi;

  group('This tests Stream API', () {
    test('Should stream chat messages from the room as StreamEvent', () async {
      final stream = await streamApi.chatMessages(chatRoomId);
      stream.listen(
        (v) {
          print('Is heartbeat: ${v.isHeartbeat}');
        },
        onError: (e) => print(e),
        cancelOnError: true,
      );
      expect(stream is Stream<StreamEvent>, true);

      emitsDone;
    });

    test('Should stream room events from the room as StreamEvent', () async {
      final result = await streamApi.roomEvents(chatRoomId);
      expect(true, result is Stream<StreamEvent>);
      emitsDone;
    });
  }, skip: true);
}
