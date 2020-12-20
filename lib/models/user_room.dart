import 'dart:convert';

import 'permission.dart';

class Room {
  final String id;
  final String name;
  final String topic;
  final String avatarUrl;
  final String uri;
  final bool oneToOne;
  final int userCount;
  final int unreadItems;
  final int mentions;
  final DateTime lastAccessTime;
  final bool lurk;
  final String url;
  final String githubType;
  final String security;
  final bool noindex;
  final List<dynamic> tags;
  final Permissions permissions;
  final bool roomMember;
  final String groupId;
  final bool public;
  final int v;

  Room({
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
    this.lurk,
    this.url,
    this.githubType,
    this.security,
    this.noindex,
    this.tags,
    this.permissions,
    this.roomMember,
    this.groupId,
    this.public,
    this.v,
  });

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
    DateTime lastAccessTime,
    bool lurk,
    String url,
    String githubType,
    String security,
    bool noindex,
    List<dynamic> tags,
    Permissions permissions,
    bool roomMember,
    String groupId,
    bool public,
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
      lurk: lurk ?? this.lurk,
      url: url ?? this.url,
      githubType: githubType ?? this.githubType,
      security: security ?? this.security,
      noindex: noindex ?? this.noindex,
      tags: tags ?? this.tags,
      permissions: permissions ?? this.permissions,
      roomMember: roomMember ?? this.roomMember,
      groupId: groupId ?? this.groupId,
      public: public ?? this.public,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'Room(id: $id, name: $name, topic: $topic, avatarUrl: $avatarUrl, uri: $uri, oneToOne: $oneToOne, userCount: $userCount, unreadItems: $unreadItems, mentions: $mentions, lastAccessTime: $lastAccessTime, lurk: $lurk, url: $url, githubType: $githubType, security: $security, noindex: $noindex, tags: $tags, permissions: $permissions, roomMember: $roomMember, groupId: $groupId, public: $public, v: $v)';
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
      'lastAccessTime': lastAccessTime?.millisecondsSinceEpoch,
      'lurk': lurk,
      'url': url,
      'githubType': githubType,
      'security': security,
      'noindex': noindex,
      'tags': tags,
      'permissions': permissions?.toMap(),
      'roomMember': roomMember,
      'groupId': groupId,
      'public': public,
      'v': v,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
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
      lastAccessTime:
          DateTime.fromMillisecondsSinceEpoch(map['lastAccessTime']),
      lurk: map['lurk'],
      url: map['url'],
      githubType: map['githubType'],
      security: map['security'],
      noindex: map['noindex'],
      tags: List<dynamic>.from(map['tags']),
      permissions: Permissions.fromMap(map['permissions']),
      roomMember: map['roomMember'],
      groupId: map['groupId'],
      public: map['public'],
      v: map['v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source));
}
