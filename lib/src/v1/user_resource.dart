part of gitterapi;

/// This class contains the methods for userresources endpoint of gitter api.
///
/// [Check out the gitter documentation](https://developer.gitter.im/docs/user-resource)
class UserResource extends Resource<V1> {
  UserResource(V1 v1) : super(v1, 'user');

  /// Returns a currently signed in user.
  /// Recommended instead of [getCurrentuser()].
  Future<Map> me() {
    return _v._jsonRequest<Map>('$_path/me');
  }

  /// Get the current user.
  ///
  /// Not Recommended instead use [me(...)] method.
  Future<Map> getCurrentUser() async {
    return (await _v._jsonRequest<List>(_path))[0] as Map;
  }

  /// List of Rooms the user is part of.
  Future<List<dynamic>> getRooms(String userId) {
    return _v._jsonRequest<List<dynamic>>('$_path/$userId/rooms');
  }

  /// Hide the room for the user.
  Future<void> hideRoom(String userId, String roomId) {
    return _v._jsonRequest<void>(
      '$_path/$userId/rooms/$roomId',
      method: 'DELETE',
    );
  }

  /// You can retrieve unread items and mentions using the following method.
  Future<Map> getUnreadItems(String userId, String roomId) {
    return _v._jsonRequest<Map>(
      '$_path/$userId/rooms/$roomId/unreadItems',
    );
  }

  /// There is an additional method nested under rooms that you can use to mark chat messages as read.
  Future<void> markUnReadItemsAsRead(
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

  ///  List of the user's GitHub Organisations and their respective Room if available.
  Future<List<dynamic>> getOrgs(String userId) {
    return _v._jsonRequest<List<dynamic>>('$_path/$userId/orgs');
  }

  /// List of the user's GitHub Repositories and their respective Room if available.
  ///
  /// Note: It'll return private repositories if the current user has granted Gitter privileges to access them.
  Future<List<dynamic>> getRepos(String userId) {
    return _v._jsonRequest<List<dynamic>>('$_path/$userId/repos');
  }

  /// List of Gitter channels nested under the current user.
  Future<List<dynamic>> getChannels(String userId) {
    return _v._jsonRequest<List<dynamic>>(
      '$_path/$userId/channels',
    );
  }
}
