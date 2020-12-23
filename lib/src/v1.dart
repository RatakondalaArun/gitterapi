part of gitterapi;

class V1 extends Version {
  @override
  String get version => 'v1';

  // GitterApi _api;
  UserResource _userResource;
  RoomsResource _roomsResource;
  MessagesResource _messagesResource;
  GroupsResource _groupsResource;

  UserResource get userResource => _userResource;
  RoomsResource get roomResource => _roomsResource;
  MessagesResource get messageResource => _messagesResource;
  GroupsResource get groupResource => _groupsResource;

  V1(GitterApi api) : super(api) {
    _userResource = UserResource(this);
    _roomsResource = RoomsResource(this);
    _messagesResource = MessagesResource(this);
    _groupsResource = GroupsResource(this);
  }

  Future<T> jsonRequest<T>(
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

    // send request
    final response = await duo.request<T>(
      '/$version/$path',
      queryParameters: _sanatized(queryParameters),
      data: _sanatized(postData),
    );

    // if statusCode is not 200 throw a error
    if (response.statusCode != 200) {
      throw GitterApiException(
        'statusCode != 200 statusMessage: ${response.statusMessage} statusCode:${response.statusCode}',
        response: response.data != null
            ? {'data': response.data, 'statusCode': response.statusCode}
            : null,
      );
    }

    // cast the response.data to type T
    return response.data;
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
