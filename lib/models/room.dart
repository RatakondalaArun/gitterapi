import 'permission.dart';

/// Represents a room.
class Room {
  ///Room ID.
  final String id;

  /// Room name.
  final String name;

  /// Room topic. (default: GitHub repo description)
  final String topic;

  /// Avatar Url.
  final String avatarUrl;

  /// Room URI on Gitter.
  final String uri;

  /// Indicates if the room is a one-to-one chat.
  final bool oneToOne;

  /// Count of users in the room.
  final int userCount;

  /// Number of unread messages for the current user.
  final int unreadItems;

  /// Number of unread mentions for the current user.
  final int mentions;

  /// Last time the current user accessed the room in ISO format.
  final String lastAccessTime;

  /// This wil be 1 if user marked this as favourite.
  final int favourite;

  /// Indicates if the current user has disabled notifications.
  final bool lurk;

  /// Path to the room on gitter.
  final String url;

  /// Type of the room.
  final String githubType;

  /// Public or private rome
  final String security;

  /// Tags that define the room.
  final List<String> tags;

  /// true user is a room member.
  final bool roomMember;

  /// Group it to which this room belongs.
  /// if this is one-to-one this will be null
  final String groupId;

  /// If this room is public
  final bool public;

  /// Wheather be indexed by search engines.
  final bool noindex;

  /// Permissions user have in this room.
  final Permissions permissions;

  /// Room version.
  final int v;

  /// Returns [RoomType] by parsing `githubType`.
  RoomType get roomType => RoomTypeExtension.parse(githubType);

  /// Returns [DateTime] instance of `lastAccessTime`.
  DateTime get lastAccessTimeAsDateTime {
    return DateTime.tryParse(
      lastAccessTime ?? DateTime.now().toUtc().toString(),
    );
  }

  /// Creates a instance of [Room].
  const Room({
    this.id,
    this.name,
    this.topic,
    this.avatarUrl,
    this.uri,
    this.oneToOne,
    this.userCount,
    this.unreadItems,
    this.mentions,
    this.lastAccessTime,
    this.favourite,
    this.lurk,
    this.url,
    this.githubType,
    this.tags,
    this.noindex,
    this.security,
    this.roomMember,
    this.groupId,
    this.public,
    this.permissions,
    this.v,
  });

  factory Room.fromMap(Map map) {
    if (map == null) return null;

    return Room(
      id: map['id'],
      name: map['name'],
      topic: map['topic'],
      avatarUrl: map['avatarUrl'],
      uri: map['uri'],
      oneToOne: map['oneToOne'],
      userCount: map['userCount'],
      unreadItems: map['unreadItems'],
      mentions: map['mentions'],
      lastAccessTime: map['lastAccessTime'],
      favourite: map['favourite'],
      lurk: map['lurk'],
      url: map['url'],
      githubType: map['githubType'],
      tags: List.castFrom<dynamic, String>(map['tags']),
      security: map['security'],
      roomMember: map['roomMember'],
      groupId: map['groupId'],
      public: map['public'],
      noindex: map['noindex'],
      permissions: Permissions.fromMap(map['permissions']),
      v: map['v'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'topic': topic,
      'avatarUrl': avatarUrl,
      'uri': uri,
      'oneToOne': oneToOne,
      'userCount': userCount,
      'unreadItems': unreadItems,
      'mentions': mentions,
      'lastAccessTime': lastAccessTime,
      'favourite': favourite,
      'lurk': lurk,
      'url': url,
      'githubType': githubType,
      'tags': tags,
      'security': security,
      'noindex': noindex,
      'roomMember': roomMember,
      'groupId': groupId,
      'public': public,
      'permissions': permissions?.toMap(),
      'v': v,
    };
  }

  Room copyWith({
    String id,
    String name,
    String topic,
    String avatarUrl,
    String uri,
    bool oneToOne,
    int userCount,
    int unreadItems,
    int mentions,
    String lastAccessTime,
    int favourite,
    bool lurk,
    String url,
    String githubType,
    String security,
    List<String> tags,
    bool roomMember,
    String groupId,
    bool public,
    bool noindex,
    Permissions permissions,
    int v,
  }) {
    return Room(
      id: id ?? this.id,
      name: name ?? this.name,
      topic: topic ?? this.topic,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      uri: uri ?? this.uri,
      oneToOne: oneToOne ?? this.oneToOne,
      userCount: userCount ?? this.userCount,
      unreadItems: unreadItems ?? this.unreadItems,
      mentions: mentions ?? this.mentions,
      lastAccessTime: lastAccessTime ?? this.lastAccessTime,
      favourite: favourite ?? this.favourite,
      lurk: lurk ?? this.lurk,
      url: url ?? this.url,
      githubType: githubType ?? this.githubType,
      security: security ?? this.security,
      tags: tags ?? this.tags,
      roomMember: roomMember ?? this.roomMember,
      groupId: groupId ?? this.groupId,
      public: public ?? this.public,
      noindex: noindex ?? this.noindex,
      permissions: permissions ?? this.permissions,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'Room(\n${toMap()}\n)';
  }
}

/// Type of room.
enum RoomType {
  /// This room is belonged to organization.
  org,

  /// This room is belonged to Repository.
  repo,

  /// This room is a one to one chat( Direct message ).
  oneToOne,

  /// This is a Organization channel
  orgChannel,

  /// This is a Repository channel
  repoChannel,

  /// This is a User channel
  userChannel,
}

/// Extension on [RoomType]. Used to parse [RoomType] to [String]
/// and back.
extension RoomTypeExtension on RoomType {
  /// Returns [Map<RoomType,String>] with respect to there string.
  static const names = {
    RoomType.org: 'ORG',
    RoomType.repo: 'REPO',
    RoomType.oneToOne: 'ONETOONE',
    RoomType.orgChannel: 'ORG_CHANNEL',
    RoomType.repoChannel: 'REPO_CHANNEL',
    RoomType.userChannel: 'USER_CHANNEL',
  };

  static const values = {
    'ORG': RoomType.org,
    'REPO': RoomType.repo,
    'ONETOONE': RoomType.oneToOne,
    'ORG_CHANNEL': RoomType.orgChannel,
    'REPO_CHANNEL': RoomType.repoChannel,
    'USER_CHANNEL': RoomType.userChannel,
  };

  /// Returns [String] value.
  String get name {
    if (!names.containsKey(this)) {
      return 'REPO';
    }
    return names[this];
  }

  /// Return [RoomType] by parsing value.
  static RoomType parse(String value) {
    if (!values.containsKey(value)) {
      return RoomType.repo;
    }
    return values[value];
  }
}
