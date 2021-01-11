// import 'room.dart';

/// Represents repo.
///
/// ```json
/// {
///   "type": "GH_REPO",
///   "id": 323052593,
///   "name": "RatakondalaArun/gitterapi",
///   "description": "A Dart client library for accessing Gitter API.",
///   "absoluteUri": "https://github.com/RatakondalaArun/gitterapi",
///   "uri": "RatakondalaArun/gitterapi",
///   "private": false,
///   "exists": false,
///   "avatar_url": "https://avatars3.githubusercontent.com/u/47482264?v=4"
/// },
/// ```
class Repo {
  final String type;
  final int id;
  final String name;
  final String description;
  final String absoluteUri;
  final String uri;
  final bool private;
  final bool exists;
  final String avatarUrl;

  /// Creates a instance of [Repo].
  Repo({
    this.type,
    this.id,
    this.name,
    this.description,
    this.absoluteUri,
    this.uri,
    this.private,
    this.exists,
    this.avatarUrl,
  });

  factory Repo.fromMap(Map map) {
    if (map == null) return null;
    return Repo(
      type: map['type'],
      id: map['id'],
      name: map['name'],
      description: map['description'],
      absoluteUri: map['absoluteUri'],
      uri: map['uri'],
      private: map['private'],
      exists: map['exists'],
      avatarUrl: map['avatar_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "type": type,
      "id": id,
      "name": name,
      "description": description,
      "absoluteUri": absoluteUri,
      "uri": uri,
      "private": private,
      "exists": exists,
      "avatar_url": avatarUrl
    };
  }

  Repo copyWith({
    String type,
    int id,
    String name,
    String description,
    String absoluteUri,
    String uri,
    bool private,
    bool exists,
    String avatarUrl,
  }) {
    return Repo(
      type: type ?? this.type,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      absoluteUri: absoluteUri ?? this.absoluteUri,
      uri: uri ?? this.uri,
      private: private ?? this.private,
      exists: exists ?? this.exists,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  String toString() => 'Repo(\n${toMap()}\n)';
}

// class RepoWithRoom extends Repo {
//   final Room room;

//   RepoWithRoom({
//     String type,
//     int id,
//     String name,
//     String description,
//     String absoluteUri,
//     String uri,
//     bool private,
//     bool exists,
//     String avatarUrl,
//     this.room,
//   }) : super(
//           type: type,
//           id: id,
//           name: name,
//           description: description,
//           absoluteUri: absoluteUri,
//           uri: uri,
//           private: private,
//           exists: exists,
//           avatarUrl: avatarUrl,
//         );

//   factory RepoWithRoom.fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;

//     return RepoWithRoom(
//       type: map['type'],
//       id: map['id'],
//       name: map['name'],
//       description: map['description'],
//       absoluteUri: map['absoluteUri'],
//       uri: map['uri'],
//       private: map['private'],
//       exists: map['exists'],
//       avatarUrl: map['avatar_url'],
//       room: Room.fromMap(map['room']),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return super.toMap()..addAll({'room': room?.toMap()});
//   }

//   RepoWithRoom copyWith({
//     String type,
//     int id,
//     String name,
//     String description,
//     String absoluteUri,
//     String uri,
//     bool private,
//     bool exists,
//     String avatarUrl,
//     Room room,
//   }) {
//     return RepoWithRoom(
//       type: type ?? this.type,
//       id: id ?? this.id,
//       name: name ?? this.name,
//       description: description ?? this.description,
//       absoluteUri: absoluteUri ?? this.absoluteUri,
//       uri: uri ?? this.uri,
//       private: private ?? this.private,
//       exists: exists ?? this.exists,
//       avatarUrl: avatarUrl ?? this.avatarUrl,
//       room: room ?? this.room,
//     );
//   }

//   @override
//   String toString() => 'RepoWithRoom(\n${toMap()}\n)';
// }
