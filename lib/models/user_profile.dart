/// Github profile.
class UserProfile {
  /// Id of the user.
  final String id;

  /// User name of the user.
  final String username;

  /// Display name of the user.
  final String displayName;

  ///
  final bool hasGitterLogin;

  /// Company user mentioned in his profile.
  /// Only github
  final String company;

  /// Location user mentioned in his profile.
  /// Only github
  final String location;

  /// Email user mentioned in his profile.
  /// only github
  final String email;

  /// Website user mentioned in his profile.
  /// Only github
  final String website;

  /// User profile link.
  /// Only github.
  final String profile;

  /// Only github
  final GithubStats github;

  /// Only gitlab provides this.
  final String gravatarImageUrl;

  /// Gvavatar version.
  final String gv;

  /// Github user avatar small (128)
  String get githubAvatarSmall {
    return 'https://avatars-01.gitter.im/gh/uv/4/$username?s=128';
  }

  /// Github user profile
  String get githubAvatarMedium {
    return 'https://avatars-01.gitter.im/gh/uv/4/$username?s=256';
  }

  /// Github user profile
  String get githubAvatarLarge {
    return 'https://avatars-01.gitter.im/gh/uv/4/$username?s=512';
  }

  /// Returns true if the user is from github.
  bool get isUserFromGithub => github != null;

  /// Create a instance of [UserProfile].
  const UserProfile({
    this.id,
    this.username,
    this.displayName,
    this.hasGitterLogin,
    this.company,
    this.location,
    this.gravatarImageUrl,
    this.email,
    this.github,
    this.website,
    this.profile,
    this.gv,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'displayName': displayName,
      'has_gitter_login': hasGitterLogin,
      'company': company,
      'location': location,
      'email': email,
      'website': website,
      'profile': profile,
      'github': github?.toMap(),
      'gravatarImageUrl': gravatarImageUrl,
      'gv': gv,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserProfile(
      id: map['id'],
      username: map['username'],
      displayName: map['displayName'],
      hasGitterLogin: map['has_gitter_login'],
      company: map['company'],
      location: map['location'],
      email: map['email'],
      website: map['website'],
      profile: map['profile'],
      github: GithubStats.fromMap(map['github']),
      gravatarImageUrl: map['gravatarImageUrl'],
      gv: map['gv'],
    );
  }

  @override
  String toString() {
    return 'GithubProfile(id: $id, username: $username, displayName: $displayName, hasGitterLogin: $hasGitterLogin, company: $company, location: $location, email: $email, website: $website, profile: $profile, github: $github, gv: $gv)';
  }

  UserProfile copyWith({
    String id,
    String username,
    String displayName,
    bool hasGitterLogin,
    String company,
    String location,
    String email,
    String website,
    String profile,
    GithubStats github,
    String gravatarImageUrl,
    String gv,
  }) {
    return UserProfile(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      hasGitterLogin: hasGitterLogin ?? this.hasGitterLogin,
      company: company ?? this.company,
      location: location ?? this.location,
      email: email ?? this.email,
      website: website ?? this.website,
      profile: profile ?? this.profile,
      github: github ?? this.github,
      gravatarImageUrl: gravatarImageUrl ?? this.gravatarImageUrl,
      gv: gv ?? this.gv,
    );
  }
}

/// User github profile stats
class GithubStats {
  final int followers;
  final int publicRepos;
  final int following;

  const GithubStats({
    this.followers,
    this.publicRepos,
    this.following,
  });

  factory GithubStats.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GithubStats(
      followers: map['followers'],
      publicRepos: map['public_repos'],
      following: map['following'],
    );
  }

  GithubStats copyWith({
    int followers,
    int publicRepos,
    int following,
  }) {
    return GithubStats(
      followers: followers ?? this.followers,
      publicRepos: publicRepos ?? this.publicRepos,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'followers': followers,
      'public_repos': publicRepos,
      'following': following,
    };
  }

  @override
  String toString() {
    return 'Github(followers: $followers, publicRepos: $publicRepos, following: $following)';
  }
}
