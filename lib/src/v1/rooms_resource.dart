part of gitterapi;

/// Creates methods for [Rooms-resource](https://developer.gitter.im/docs/rooms-resource).
class RoomsResource extends Resource<V1> {
  @override
  String get _path => 'rooms';

  /// Creates a instance of [this].
  RoomsResource(V1 v) : super(v, 'rooms');

  /// List rooms the current user is in.
  ///
  /// ### Parameters:
  ///
  /// - `query`: Query to search for rooms.
  ///
  Future<Result<List<dynamic>>> rooms({String query}) {
    return _v._jsonRequest<List<dynamic>>(
      _path,
      // this make sures that query values is not null.
      queryParameters: query == null ? {} : {'q': query},
    );
  }

  // TODO(@RatakondalaArun): Create a room

  /// Fetches room id from uri.
  ///
  /// ### Parameters
  ///
  /// - `uri`: Room Uri must not be null.
  ///
  /// ### Example
  /// ```
  /// String uri = 'gitterhq/sandbox';
  /// // remaining  code ......
  /// final room = getRoomIdFrom(uri);
  /// ```
  ///
  Future<Result<Map>> getRoomIdFrom(String uri) {
    return _v._jsonRequest<Map>(
      '$_path',
      method: 'POST',
      postData: {'uri': uri},
    );
  }

  /// Join the room via ID.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<void>> joinRoom(String userId, String roomId) {
    return _v._jsonRequest(
      'user/$userId/$_path',
      method: 'POST',
      postData: {'id': roomId},
    );
  }

  /// Bans the give user form the room.
  /// user must be a group admin to perform this action.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `username`: username. must not be null.
  Future<Result<void>> banUserFromRoom(String roomId, String username) {
    return _v._jsonRequest(
      '$_path/$roomId/bans',
      method: 'POST',
      postData: {'username': username},
    );
  }

  /// Update room details.
  /// user must be group admin to perform this action.
  ///
  /// ### Parameters
  ///
  /// - `topic`: Room topic.
  /// - `noindex`: Whether the room is indexed by search engines.
  /// - `tags`: Tags that define the room.
  ///
  Future<Result<void>> updateRoom(
    String roomId, {
    String topic,
    bool noindex,
    List<String> tags,
  }) {
    return _v._jsonRequest(
      '$_path/$roomId',
      method: 'PUT',
      postData: {
        'topic': topic,
        'noindex': noindex,
        'tags': tags?.join(','),
      },
    );
  }

  /// Delete a room.
  /// user must be group admin to perform this action.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  ///
  Future<Result<Map>> deleteRoom(String roomId) {
    return _v._jsonRequest<Map>('$_path/$roomId', method: 'DELETE');
  }

  /// List of Users currently in the room.
  ///
  /// ### Parameters
  ///
  /// All the parameters are optional:
  ///
  /// - `q`: Search query
  /// - `skip`: Skip n users.
  /// - `limit`: maximum number of users to return (default 30).
  ///
  Future<Result<List<dynamic>>> getUsers(
    String roomId, {
    String query,
    int skip,
    int limit = 30,
  }) {
    return _v._jsonRequest<List<dynamic>>(
      '$_path/$roomId/users',
      queryParameters: {
        'q': query,
        'skip': skip,
        'limit': limit,
      },
    );
  }
}
