part of gitterapi;

/// This class contains the methods for userresources endpoint of gitter api.
///
/// [Check out the gitter documentation](https://developer.gitter.im/docs/user-resource)
class UserResource extends Resource<V1> {
  @override
  String get path => 'user';

  UserResource(V1 v1) : super(v1);

  /// Returns a currently signed in user.
  /// Recommended instead of [getCurrentuser()].
  Future<Map<String, dynamic>> me() {
    return v.jsonRequest<Map<String, dynamic>>('$path/me');
  }

  /// Get the current user.
  ///
  /// Not Recommended instead use [me(...)] method.
  Future<Map<String, dynamic>> getCurrentUser() async {
    return (await v.jsonRequest<List<Map<String, dynamic>>>(path))[0];
  }

  /// List of Rooms the user is part of.
  Future<List<dynamic>> getRooms(String userId) {
    return v.jsonRequest<List<dynamic>>('$path/$userId/rooms');
  }

  /// Hide the room for the user.
  Future<void> hideRoom(String userId, String roomId) {
    return v.jsonRequest<dynamic>(
      '$path/$userId/rooms/$roomId',
      method: 'DELETE',
    );
  }

  /// You can retrieve unread items and mentions using the following method.
  Future<Map<String, dynamic>> getUnreadItems(String userId, String roomId) {
    return v.jsonRequest<Map<String, dynamic>>(
      '$path/$userId/rooms/$roomId/unreadItems',
    );
  }

  /// There is an additional method nested under rooms that you can use to mark chat messages as read.
  Future<void> markUnReadItemsAsRead(
    String userId,
    String roomId,
    List<String> chatIds,
  ) {
    return v.jsonRequest<Map<String, dynamic>>(
      '$path/$userId/rooms/$roomId/unreadItems',
      method: 'POST',
      postData: {'chat': chatIds},
    );
  }

  ///  List of the user's GitHub Organisations and their respective Room if available.
  Future<List<Map<String, dynamic>>> getOrgs(String userId) {
    return v.jsonRequest<List<Map<String, dynamic>>>('$path/$userId/orgs');
  }

  /// List of the user's GitHub Repositories and their respective Room if available.
  ///
  /// Note: It'll return private repositories if the current user has granted Gitter privileges to access them.
  Future<List<Map<String, dynamic>>> getRepos(String userId) {
    return v.jsonRequest<List<Map<String, dynamic>>>('$path/$userId/repos');
  }

  /// List of Gitter channels nested under the current user.
  Future<List<Map<String, dynamic>>> getChannels(String userId) {
    return v.jsonRequest<List<Map<String, dynamic>>>(
      '$path/$userId/channels',
    );
  }
}
