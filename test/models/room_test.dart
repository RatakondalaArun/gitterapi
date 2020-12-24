import 'package:test/test.dart';
import 'package:gitterapi/models.dart' show Room;

void main() {
  final model = {
    "id": "5787e94cc2f0db084a230583",
    "name": "dart-lang/sdk",
    "topic":
        "The Dart SDK, including the VM, dart2js, core libraries, and more.",
    "avatarUrl":
        "https://avatars-03.gitter.im/group/iv/4/57542ca9c43b8c6019775551",
    "uri": "dart-lang/sdk",
    "oneToOne": false,
    "userCount": 1958,
    "unreadItems": 99,
    "mentions": 0,
    "lastAccessTime": "2020-12-23T14:14:03.220Z",
    "lurk": false,
    "url": "/dart-lang/sdk",
    "githubType": "REPO",
    "security": "PUBLIC",
    "noindex": false,
    "tags": [],
    "permissions": {"admin": false},
    "roomMember": true,
    "groupId": "57542ca9c43b8c6019775551",
    "public": true,
    "v": 2
  };

  test('This Should convert Map to Room object', () {
    final result = Room.fromMap(model);
    expect(result.toMap(), equals(model));
  });

  test('Should return null when used passed a null Map', () {
    final result = Room.fromMap(null);
    expect(result, null);
  });
}
