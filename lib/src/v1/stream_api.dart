part of gitterapi;

/// The streaming API allows real-time access to rooms.
///
/// This class methods sends [StreamEvent]s.
class StreamApi extends Resource<V1> {
  StreamApi(V1 v) : super(v, 'rooms');

  /// This returns chat message send by users in room.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  ///
  Future<Stream<StreamEvent>> chatMessages(String roomId) async {
    return _v._streamRequest('$_path/$roomId/chatMessages');
  }

  /// This returns room events.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  ///
  Future<Stream<StreamEvent>> roomEvents(String roomId) async {
    return _v._streamRequest('$_path/$roomId/events');
  }
}
