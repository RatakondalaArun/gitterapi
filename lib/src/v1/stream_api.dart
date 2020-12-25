part of gitterapi;

/// The JSON stream returns messages as JSON objects
/// that are delimited by newline (\n). Space + newline
/// (\n) are sent as periodic "keep-alive" messages to
/// tell clients and NAT firewalls that the connection
/// is still alive during low message volume periods.
class StreamApi extends Resource<V1> {
  StreamApi(V1 v) : super(v);

  @override
  String get _path => 'rooms';

  /// This returns chat message send by users in room.
  Future<Stream<StreamEvent>> chatMessages(String roomId) async {
    return _v._streamRequest('$_path/$roomId/chatMessages');
  }

  /// This returns room events.
  Future<Stream<StreamEvent>> roomEvents(String roomId) async {
    return _v._streamRequest('$_path/$roomId/events');
  }
}
