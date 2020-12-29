part of gitterapi;

class V1 extends Version {
  UserResource _userResource;
  RoomsResource _roomsResource;
  MessagesResource _messagesResource;
  GroupsResource _groupsResource;
  StreamApi _streamApi;

  UserResource get userResource => _userResource;
  RoomsResource get roomResource => _roomsResource;
  MessagesResource get messageResource => _messagesResource;
  GroupsResource get groupResource => _groupsResource;
  StreamApi get streamApi => _streamApi;

  V1(GitterApi api) : super(api, 'v1') {
    _userResource = UserResource(this);
    _roomsResource = RoomsResource(this);
    _messagesResource = MessagesResource(this);
    _groupsResource = GroupsResource(this);
    _streamApi = StreamApi(this);
  }

  Future<Result<T>> _jsonRequest<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Map<String, dynamic> postData = const <String, dynamic>{},
  }) async {
    // initilize BaseOptions
    final options = BaseOptions(
      method: method,
      baseUrl: 'https://${_api.host}',
      responseType: ResponseType.json,
      contentType: 'application/json',
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${_api.keys.authToken}',
        HttpHeaders.acceptHeader: 'application/json'
      },
    );

    // instance of duo with BaseOptions
    final duo = new Dio(options);

    Response<T> response;
    try {
      // send request
      response = await duo.request<T>(
        '/$_version/$path',
        queryParameters: _sanatized(queryParameters),
        data: _sanatized(postData),
      );

      // Converts response to Result object.
      return Result<T>.success(
        headers: response.headers,
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } catch (e, st) {
      // Convert exceptions to Result object
      return Result<T>.fromError(
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        error: e,
        stackTrace: st,
        data: response.data,
      );
    }
  }

  Future<Stream<StreamEvent>> _streamRequest(
    String path, {
    String method = 'GET',
  }) async {
    // initilize BaseOptions
    final options = BaseOptions(
      method: method,
      baseUrl: 'https://stream.gitter.im',
      responseType: ResponseType.stream,
      contentType: 'application/json',
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${_api.keys.authToken}',
        HttpHeaders.acceptHeader: 'application/json'
      },
    );

    // instance of duo with BaseOptions
    final duo = new Dio(options);
    Response<ResponseBody> response;

    try {
      response = await duo.request<ResponseBody>('/$_version/$path');
    } on DioError catch (e) {
      // catch all DioErrors.
      throw GitterApiException.fromDio(e);
    } catch (_) {
      // rethrow remaining exceptions.
      rethrow;
    }

    // Converts stream to [StreamEvent]
    return response.data.stream
        .map<StreamEvent>((d) => StreamEvent.parse(d))
        .asBroadcastStream();
  }
}

@visibleForTesting
Map<String, dynamic> sanatized(Map<String, dynamic> map) => _sanatized(map);

/// Removes all the null value keys.
/// This only sanitize top-level values.
Map<String, dynamic> _sanatized(Map<String, dynamic> map) {
  final sanitizedMap = <String, dynamic>{};
  map?.forEach((key, value) {
    if (value != null) {
      sanitizedMap[key] = value;
    }
  });
  return sanitizedMap;
}

/// This events are returned [StreamEvent]
enum StreamEventType {
  /// This event is sent by server
  /// to keep connection **alive**
  /// this event only contains *&space+'/n'**
  heartbeat,

  /// This event contains data.
  data,
}

/// This is the event emitted by [V1]'s [streamRequest()].
class StreamEvent {
  /// Event type
  final StreamEventType eventType;

  /// This contains data sent by stream.
  ///
  /// If `eventType` is [StreamEventType.heartbeat] then
  /// this will be empty.
  final Map data;

  /// Helper method to check if this
  /// is a heartbeat event. Returns
  /// true if this event is of type heartbeat.
  bool get isHeartbeat => eventType == StreamEventType.heartbeat;

  /// Instance of [this].
  StreamEvent({
    this.eventType,
    this.data,
  });

  /// Parses Stream data to [StreamEvent].
  factory StreamEvent.parse(Uint8List data) {
    if (data == null) return null;
    // decoding data to check if this is
    // a 'StremEventType.heartBeat'.
    final decoded = String.fromCharCodes(data ?? '').trim();
    final isHeartbeat = decoded.isEmpty;
    return StreamEvent(
      eventType: isHeartbeat ? StreamEventType.heartbeat : StreamEventType.data,
      data: isHeartbeat ? {} : jsonDecode(decoded),
    );
  }

  @override
  String toString() => 'StreamEvent(eventType: $eventType, data: $data)';
}
