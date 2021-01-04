part of gitterapi;

/// Creates methods for [User-resource](https://developer.gitter.im/docs/user-resource).
class UserResource extends Resource<V1> {
  /// Creates a instance of [this].
  UserResource(V1 v1) : super(v1, 'user');

  /// Returns currently signed in user.
  Future<Result<Map>> me() {
    return _v._jsonRequest<Map>('$_path/me');
  }

  /// Returns Profile by username.
  /// This can return github or gitlab pofiles.
  /// ### Parameters
  ///
  /// - `username`: Gitter username.
  ///
  Future<Result<Map>> getProfileByUsername(String username) {
    return _v._jsonRequest<Map>('users/$username');
  }

  /// List of Rooms the user is part of.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  ///
  Future<Result<List<dynamic>>> getRooms(String userId) {
    return _v._jsonRequest<List<dynamic>>('$_path/$userId/rooms');
  }

  /// Hide the room for the user.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<void>> hideRoom(String userId, String roomId) {
    return _v._jsonRequest<void>(
      '$_path/$userId/rooms/$roomId',
      method: 'DELETE',
    );
  }

  /// You can retrieve unread items and mentions
  /// using the following method.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<Map>> getUnreadItems(String userId, String roomId) {
    return _v._jsonRequest<Map>(
      '$_path/$userId/rooms/$roomId/unreadItems',
    );
  }

  /// There is an additional method nested under rooms
  /// that you can use to mark chat messages as read.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  /// - `chatIds`: [List] of chat ids to marks them as read.
  ///
  Future<Result<void>> markUnReadItemsAsRead(
    String userId,
    String roomId,
    List<String> chatIds,
  ) {
    return _v._jsonRequest<void>(
      '$_path/$userId/rooms/$roomId/unreadItems',
      method: 'POST',
      postData: {'chat': chatIds},
    );
  }

  /// List of the user's GitHub Organisations and their respective Room if available.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  ///
  Future<Result<List<dynamic>>> getOrgs(String userId) {
    return _v._jsonRequest<List<dynamic>>('$_path/$userId/orgs');
  }

  /// List of the user's GitHub Repositories and their respective Room if available.
  ///
  /// *Note: It'll return private repositories if the current user has granted Gitter privileges to access them.*
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  ///
  Future<Result<List<dynamic>>> getRepos(String userId) {
    return _v._jsonRequest<List<dynamic>>('$_path/$userId/repos');
  }

  /// List of Gitter channels nested under the current user.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  ///
  Future<Result<List<dynamic>>> getChannels(String userId) {
    return _v._jsonRequest<List<dynamic>>(
      '$_path/$userId/channels',
    );
  }

  /// Add Room to user favourite.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<void>> addFav(String userId, String roomId) {
    return _v._jsonRequest<void>(
      '/user/$userId/rooms/$roomId',
      method: 'PUT',
      postData: {"favourite": true},
    );
  }

  /// Remove Room from user favourite.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<void>> removeFav(String userId, String roomId) {
    return _v._jsonRequest<void>(
      '/user/$userId/rooms/$roomId',
      method: 'PUT',
      postData: {"favourite": false},
    );
  }
}
