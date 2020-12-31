import 'package:test/test.dart';
import 'package:gitterapi/models.dart' show Message;

void main() {
  final messageWithOutEditedAt = {
    "id": "5fedc44197312f4b6bfe4519",
    "text":
        "test @RatakondalaArun #11  https://gitter.im/RatakondalaArun/gitterapi",
    "html":
        "test <span data-link-type=\"mention\" data-screen-name=\"RatakondalaArun\" class=\"mention\">@RatakondalaArun</span> <a target=\"_blank\" data-link-type=\"issue\" data-issue=\"11\" class=\"issue\">#11</a>  <a href=\"https://gitter.im/RatakondalaArun/gitterapi\" rel=\"nofollow noopener noreferrer\" target=\"_blank\" class=\"link \">https://gitter.im/RatakondalaArun/gitterapi</a>",
    "sent": "2020-12-31T12:29:53.036Z",
    "unread": false,
    "readBy": 0,
    "urls": [
      {"url": "https://gitter.im/RatakondalaArun/gitterapi"}
    ],
    "mentions": [
      {
        "screenName": "RatakondalaArun",
        "userId": "5f9ab228d73408ce4ff2c66c",
        "userIds": []
      }
    ],
    "issues": [
      {"number": "11"}
    ],
    "meta": [],
    "v": 2,
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

  // final messagesWithAll = {
  //   "id": "5fedd054ac9d8e7463e0e0ea",
  //   "text":
  //       "edited again\n@RatakondalaArun\n#12\nhttps://gitter.im/RatakondalaArun/gitterapi",
  //   "html":
  //       "<p>edited again<br><span data-link-type=\"mention\" data-screen-name=\"RatakondalaArun\" class=\"mention\">@RatakondalaArun</span></p><p><a target=\"_blank\" data-link-type=\"issue\" data-issue=\"12\" class=\"issue\">#12</a>\n</p><p><a href=\"https://gitter.im/RatakondalaArun/gitterapi\" rel=\"nofollow noopener noreferrer\" target=\"_blank\" class=\"link \">https://gitter.im/RatakondalaArun/gitterapi</a></p>",
  //   "sent": "2020-12-31T13:21:24.539Z",
  //   "editedAt": "2020-12-31T13:22:37.870Z",
  //   "threadMessageCount": 1,
  //   "unread": false,
  //   "readBy": 0,
  //   "urls": [
  //     {"url": "https://gitter.im/RatakondalaArun/gitterapi"}
  //   ],
  //   "mentions": [
  //     {
  //       "screenName": "RatakondalaArun",
  //       "userId": "5f9ab228d73408ce4ff2c66c",
  //       "userIds": []
  //     }
  //   ],
  //   "issues": [
  //     {"number": "12"}
  //   ],
  //   "meta": [],
  //   "v": 4,
  //   "fromUser": {
  //     "id": "5f9ab228d73408ce4ff2c66c",
  //     "username": "RatakondalaArun",
  //     "displayName": "Ratakondala Arun",
  //     "url": "/RatakondalaArun",
  //     "avatarUrl": "https://avatars-03.gitter.im/gh/uv/4/RatakondalaArun",
  //     "avatarUrlSmall":
  //         "https://avatars1.githubusercontent.com/u/47482264?v=4&s=60",
  //     "avatarUrlMedium":
  //         "https://avatars1.githubusercontent.com/u/47482264?v=4&s=128",
  //     "v": 15,
  //     "gv": "4"
  //   }
  // };

  // test('Object map should be same length as user map', () {
  //   final result = Message.fromMap(messageWithOutEditedAt);
  //   expect(result.toMap().length, messageWithOutEditedAt.length);
  // });

  test('This fields should not be null', () {
    final result = Message.fromMap(messageWithOutEditedAt);
    expect(result != null, true);
    expect(result.issues != null, true);
    expect(result.mentions != null, true);
    expect(result.fromUser != null, true);
    expect(result.issues != null, true);
    expect(result.urls != null, true);
  });

  test('This Should return null insted of throwing Exception.', () {
    final result = Message.fromMap(messageWithOutEditedAt);
    expect(result.editedAtAs, null);
  });

  test('This Should return null when used passed a null Map.', () {
    final result = Message.fromMap(null);
    expect(result, null);
  });
}
