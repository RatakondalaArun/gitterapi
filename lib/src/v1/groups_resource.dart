part of gitterapi;

/// Contains methods for [Group-Resources](https://developer.gitter.im/docs/groups-resource).
class GroupsResource extends Resource<V1> {
  /// Creates a instance of [this].
  GroupsResource(V1 v) : super(v, 'groups');

  /// List groups the current user is in.
  Future<Result<List>> getGropus() {
    return _v._jsonRequest<List>('$_path');
  }

  /// List of rooms nested under the specified group.
  ///
  /// ### Parameters:
  ///
  /// - `groupId`: Id of the group.
  ///
  Future<Result<List>> getRooms(String groupId) {
    return _v._jsonRequest<List>('$_path/$groupId/rooms');
  }

  /// Create room nested under the specified group.
  ///
  /// ### Parameters:
  ///
  /// - `groupId`: Id of the group.
  /// - `name`: Room name.W
  /// - `topic`: Room topic/description.
  /// - `security`: Describes the backing object we get permissions from. (defaults to 'PUBLIC').
  /// - `type`: null|'ONE_TO_ONE'|'GH_REPO'|'GH_ORG'|'GH_USER'.
  /// - `linkPath`: Represents how we find the backing object given the type.
  /// - `source`: Tracking info for stats.
  ///
  Future<Result<Map>> createRoom(
    String groupId, {
    String name,
    String topic,
    String security = 'PUBLIC',
    String type,
    String linkPath,
    String source,
  }) {
    // TODO(@RatakondalaArun): Not sure how this works
    // checkout this https://developer.gitter.im/docs/groups-resource
    return _v._jsonRequest<Map>(
      '$_path/$groupId/rooms',
      method: 'POST',
      postData: {
        'name': name,
        'topic': topic,
        'security': {
          'security': security,
          'type': type,
          'linkPath': linkPath,
        },
        'source': source,
      },
    );
  }
}
