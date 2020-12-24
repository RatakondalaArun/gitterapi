import 'package:test/test.dart';
import 'package:gitterapi/models.dart' show Message;

void main() {
  final model = {
    "id": "5fe4c9692084ee4b786e35c3",
    "text":
        "@mohammadzaidhussain this is just a test to write the test case #12 https://github.com/RatakondalaArun/gitterapi",
    "html":
        "<span data-link-type=\"mention\" data-screen-name=\"mohammadzaidhussain\" class=\"mention\">@mohammadzaidhussain</span> this is just a test to write the test case <a target=\"_blank\" data-link-type=\"issue\" data-issue=\"12\" class=\"issue\">#12</a> <a href=\"https://github.com/RatakondalaArun/gitterapi\" rel=\"nofollow noopener noreferrer\" target=\"_blank\" class=\"link \">https://github.com/RatakondalaArun/gitterapi</a>",
    "sent": "2020-12-24T17:01:29.183Z",
    "unread": false,
    "readBy": 0,
    "urls": [
      {"url": "https://github.com/RatakondalaArun/gitterapi"}
    ],
    "mentions": [
      {
        "screenName": "mohammadzaidhussain",
        "userId": "5fdc91e7d73408ce4ff6d879",
        "userIds": []
      }
    ],
    "issues": [
      {"number": "12"}
    ],
    "meta": [],
    "v": 1,
    "fromUser": {
      "id": "5f9ab228d73408ce4ff2c66c",
      "username": "RatakondalaArun",
      "displayName": "Ratakondala Arun",
      "url": "/RatakondalaArun",
      "avatarUrl": "https://avatars-03.gitter.im/gh/uv/4/RatakondalaArun",
      "avatarUrlSmall":
          "https://avatars1.githubusercontent.com/u/47482264?v=4&s=60",
      "avatarUrlMedium":
          "https://avatars1.githubusercontent.com/u/47482264?v=4&s=128",
      "v": 15,
      "gv": "4"
    }
  };

  test('Object map should be same length as user map', () {
    final result = Message.fromMap(model);
    expect(result.toMap().length, model.length);
  });

  test('This fields should not be null', () {
    final result = Message.fromMap(model);
    expect(result != null, true);
    expect(result.issues != null, true);
    expect(result.mentions != null, true);
    expect(result.fromUser != null, true);
    expect(result.issues != null, true);
    expect(result.urls != null, true);
  });

  test('This Should return null insted of throwing Exception.', () {
    final result = Message.fromMap(model);
    expect(result.editedAtAs, null);
  });

  test('This Should return null when used passed a null Map.', () {
    final result = Message.fromMap(null);
    expect(result, null);
  });
}
