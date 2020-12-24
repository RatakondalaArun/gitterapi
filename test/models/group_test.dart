import 'package:test/test.dart';
import 'package:gitterapi/models.dart' show Group;

void main() {
  final model = {
    "id": "57542c12c43b8c601976fa66",
    "name": "gitterHQ",
    "uri": "gitterHQ",
    "backedBy": {
      "type": "GH_ORG",
      "linkPath": "gitterHQ",
    },
    "avatarUrl":
        "http://gitter.im/api/private/avatars/group/i/577ef7e4e897e2a459b1b881"
  };

  test('This Should convert Map to Group object', () {
    final result = Group.fromMap(model);
    expect(result.toMap(), equals(model));
  });

  test('Should return null when used passed a null Map', () {
    final result = Group.fromMap(null);
    expect(result, null);
  });
}
