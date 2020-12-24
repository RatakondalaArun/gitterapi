// {
//       "id": "576c4d75c2f0db084a1f99ae",
//       "name": "flutter/flutter",
//       "topic": "Flutter makes it easy and fast to build beautiful apps for mobile and beyond.\n",
//       "avatarUrl": "https://avatars-01.gitter.im/group/iv/4/576c4d75c2f0db084a1f99ad",
//       "uri": "flutter/flutter",
//       "oneToOne": false,
//       "userCount": 12301,
//       "unreadItems": 17,
//       "mentions": 0,
//       "lastAccessTime": "2020-12-16T17:14:05.771Z",
//       "lurk": false,
//       "url": "/flutter/flutter",
//       "githubType": "REPO",
//       "security": "PUBLIC",
//       "noindex": false,
//       "tags": [],
//       "permissions": {
//           "admin": false
//       },
//       "roomMember": true,
//       "groupId": "576c4d75c2f0db084a1f99ad",
//       "public": true,
//       "v": 2
//   },

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

  /// List of users in the room.
  final String users;

  /// Count of users in the room.
  final int userCount;

  /// Number of unread messages for the current user.
  final int unreadItems;

  /// Number of unread mentions for the current user.
  final int mentions;

  /// Last time the current user accessed the room in ISO format.
  final String lastAccessTime;

  /// Indicates if the room is on of your favourites.
  final String favourite;

  /// Indicates if the current user has disabled notifications.
  final bool lurk;

  /// Path to the room on gitter.
  final String url;

  /// Type of the room.
  final String githubType;

  /// Tags that define the room.
  final List<String> tags;

  /// Room version.
  final int v;

  /// Returns [RoomType] by parsing `githubType`.
  RoomType get roomType => RoomTypeExtension.parse(githubType);

  /// Returns [DateTime] instance of `lastAccessTime`.
  DateTime get lastAccessTimeAsDateTime {
    return DateTime.tryParse(lastAccessTime) ?? DateTime.now();
  }

  const Room({
    this.id,
    this.name,
    this.topic,
    this.avatarUrl,
    this.uri,
    this.oneToOne,
    this.users,
    this.userCount,
    this.unreadItems,
    this.mentions,
    this.lastAccessTime,
    this.favourite,
    this.lurk,
    this.url,
    this.githubType,
    this.tags,
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
      users: map['users'],
      userCount: map['userCount'],
      unreadItems: map['unreadItems'],
      mentions: map['mentions'],
      lastAccessTime: map['lastAccessTime'],
      favourite: map['favourite'],
      lurk: map['lurk'],
      url: map['url'],
      githubType: map['githubType'],
      tags: List.castFrom<dynamic, String>(map['tags']),
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
      'users': users,
      'userCount': userCount,
      'unreadItems': unreadItems,
      'mentions': mentions,
      'lastAccessTime': lastAccessTime,
      'favourite': favourite,
      'lurk': lurk,
      'url': url,
      'githubType': githubType,
      'tags': tags,
      'v': v,
    };
  }

  Room copyWith({
    String id,
    String name,
    String topic,
    String uri,
    String avatarUrl,
    bool oneToOne,
    String users,
    int userCount,
    int unreadItems,
    int mentions,
    String lastAccessTime,
    String favourite,
    bool lurk,
    String url,
    String githubType,
    List<String> tags,
    int v,
  }) {
    return Room(
      id: id ?? this.id,
      name: name ?? this.name,
      topic: topic ?? this.topic,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      uri: uri ?? this.uri,
      oneToOne: oneToOne ?? this.oneToOne,
      users: users ?? this.users,
      userCount: userCount ?? this.userCount,
      unreadItems: unreadItems ?? this.unreadItems,
      mentions: mentions ?? this.mentions,
      lastAccessTime: lastAccessTime ?? this.lastAccessTime,
      favourite: favourite ?? this.favourite,
      lurk: lurk ?? this.lurk,
      url: url ?? this.url,
      githubType: githubType ?? this.githubType,
      tags: tags ?? this.tags,
      v: v ?? this.v,
    );
  }
}

enum RoomType {
  org,
  repo,
  oneToOne,
  orgChannel,
  repoChannel,
  userChannel,
}

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
