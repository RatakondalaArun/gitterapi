part of gitterapi;

/// Creates methods for [Rooms-resource](https://developer.gitter.im/docs/rooms-resource).
class RoomsResource extends Resource<V1> {
  @override
  String get _path => 'rooms';

  /// Creates a instance of [this].
  RoomsResource(V1 v) : super(v, 'rooms');

  /// List rooms the current user is in.
  ///
  Future<Result<List<dynamic>>> rooms() {
    return _v._jsonRequest<List<dynamic>>(
      _path,
      // this make sures that query values is not null.
    );
  }

  /// Searches room
  /// Query must not be null else this will throw [ArgumentError].
  ///
  /// ### Result
  ///
  /// ```
  /// {
  ///     "results": [
  ///         {
  ///             "id": "5787e94cc2f0db084a230583",
  ///             "name": "dart-lang/sdk",
  ///             "topic": "The Dart SDK, including the VM, dart2js, core libraries, and more.",
  ///             "avatarUrl": "https://avatars-03.gitter.im/group/iv/4/57542ca9c43b8c6019775551",
  ///             "uri": "dart-lang/sdk",
  ///             "oneToOne": false,
  ///             "userCount": 1967,
  ///             "unreadItems": 100,
  ///             "mentions": 0,
  ///             "lastAccessTime": "2021-01-04T17:00:06.584Z",
  ///             "lurk": false,
  ///             "url": "/dart-lang/sdk",
  ///             "githubType": "REPO",
  ///             "security": "PUBLIC",
  ///             "noindex": false,
  ///             "roomMember": true,
  ///             "groupId": "57542ca9c43b8c6019775551",
  ///             "public": true,
  ///             "v": 2
  ///         }
  ///     ]
  /// }
  /// ```
  ///
  Future<Result<Map>> search(String query, {int limit}) {
    ArgumentError.checkNotNull<String>(query, 'query');
    if (query.trim().isEmpty) {
      throw ArgumentError.value(
        query,
        'query',
        'query should not contains empty value',
      );
    }
    return _v._jsonRequest<Map>(
      _path,
      // this make sures that query values is not null.
      queryParameters: {'q': query, 'limit': limit},
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
  /// ### Examples
  ///
  /// ```dart
  /// {
  ///   "id": "55a40f2a5e0d51bd787b439c",
  ///   "name": "Microsoft/vscode",
  ///   "topic": "",
  ///   "avatarUrl": "https://avatars-04.gitter.im/group/iv/4/57542d4cc43b8c601977b6ad",
  ///   "uri": "Microsoft/vscode",
  ///   "oneToOne": false,
  ///   "userCount": 3762,
  ///   "unreadItems": 0,
  ///   "mentions": 0,
  ///   "lastAccessTime": "2021-01-16T17:45:34.172Z",
  ///   "lurk": false,
  ///   "url": "/Microsoft/vscode",
  ///   "githubType": "ORG_CHANNEL",
  ///   "associatedRepo": false,
  ///   "security": "PUBLIC",
  ///   "noindex": false,
  ///   "permissions": {
  ///      "admin": false
  ///   },
  ///   "roomMember": true,
  ///   "groupId": "57542d4cc43b8c601977b6ad",
  ///   "group": {
  ///     "id": "57542d4cc43b8c601977b6ad",
  ///     "name": "Microsoft",
  ///     "uri": "Microsoft",
  ///     "homeUri": "Microsoft/home",
  ///     "backedBy": {
  ///         "type": "GH_ORG",
  ///         "linkPath": "Microsoft"
  ///     },
  ///     "avatarUrl": "https://avatars-04.gitter.im/group/iv/4/57542d4cc43b8c601977b6ad"
  ///   },
  ///   "backend": {
  ///     "type": "GH_ORG",
  ///     "linkPath": "Microsoft"
  ///   },
  ///   "public": true,
  ///   "v": 7
  /// }
  /// ```
  Future<Result<Map>> joinRoom(String userId, String roomId) {
    return _v._jsonRequest<Map>(
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
  Future<Result<void>> banUser(String roomId, String username) {
    return _v._jsonRequest(
      '$_path/$roomId/bans',
      method: 'POST',
      postData: {'username': username},
    );
  }

  /// UnBan the give user form the room.
  /// user who is performing this must be a
  /// group admin to perform this action.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `username`: username. must not be null.
  ///
  Future<Result<void>> unbanUser(String roomId, String username) {
    return _v._jsonRequest(
      '$_path/$roomId/bans',
      method: 'DELETE',
      postData: {'username': username},
    );
  }

  /// Returns List of banned users in the room.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the Room.
  ///
  Future<Result<List>> getBannedList(String roomId) {
    return _v._jsonRequest<List>('$_path/$roomId');
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
  /// - `query`: Search query
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

  /// Repository Events.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `skip`: Skip n users.
  /// - `limit`: maximum number of users to return (default 30).
  ///
  Future<Result<List>> getRoomEvents(String roomId, {int skip, int limit}) {
    return _v._jsonRequest<List>(
      '$_path/$roomId/events',
      queryParameters: {'skip': skip, 'limit': limit},
    );
  }

  /// Returns a list of issues from the group repo.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  ///
  Future<Result<List>> getIssues(String roomId) {
    return _v._jsonRequest<List>('rooms/$roomId/issues');
  }

  /// Returns Issue details.
  ///
  /// ## Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `issueNumber`: Issue number.
  ///
  Future<Result<Map>> getIssueDetails(String roomId, String issueNumber) {
    return _v._jsonRequest<Map>('rooms/$roomId/issues/$issueNumber');
  }
}
