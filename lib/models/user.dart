import 'dart:convert';

class User {
  /// Gitter User ID.
  final String id;

  /// Gitter/GitHub username.
  final String username;

  /// Gitter/GitHub user real name.
  final String displayName;

  /// Path to the user on Gitter.
  final String url;

  /// User avatar URI
  final String avatarUrl;

  /// User avatar URI (small).
  final String avatarUrlSmall;

  /// User avatar URI (medium).
  final String avatarUrlMedium;

  /// Auth Provider
  final List<String> providers;

  /// Version
  final int v;

  /// Gavavatar version
  final String gv;

  /// Creates a instance of [User]
  const User({
    this.id,
    this.username,
    this.displayName,
    this.url,
    this.avatarUrl,
    this.avatarUrlSmall,
    this.avatarUrlMedium,
    this.providers,
    this.v,
    this.gv,
  });

  @override
  String toString() {
    return 'User(id: $id, username: $username, displayName: $displayName, url: $url, avatarUrl: $avatarUrl, avatarUrlSmall: $avatarUrlSmall, avatarUrlMedium: $avatarUrlMedium, providers: $providers, v: $v, gv: $gv)';
  }

  User copyWith({
    String id,
    String username,
    String displayName,
    String url,
    String avatarUrl,
    String avatarUrlSmall,
    String avatarUrlMedium,
    List<String> providers,
    int v,
    String gv,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      url: url ?? this.url,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      avatarUrlSmall: avatarUrlSmall ?? this.avatarUrlSmall,
      avatarUrlMedium: avatarUrlMedium ?? this.avatarUrlMedium,
      providers: providers ?? this.providers,
      v: v ?? this.v,
      gv: gv ?? this.gv,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'displayName': displayName,
      'url': url,
      'avatarUrl': avatarUrl,
      'avatarUrlSmall': avatarUrlSmall,
      'avatarUrlMedium': avatarUrlMedium,
      'providers': providers,
      'v': v,
      'gv': gv,
    };
  }

  factory User.fromMap(Map map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      username: map['username'],
      displayName: map['displayName'],
      url: map['url'],
      avatarUrl: map['avatarUrl'],
      avatarUrlSmall: map['avatarUrlSmall'],
      avatarUrlMedium: map['avatarUrlMedium'],
      providers: List<String>.from(map['providers'] ?? []),
      v: map['v'],
      gv: map['gv'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
