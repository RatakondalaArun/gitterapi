import 'package:gitterapi/models.dart' show User;
import 'package:test/test.dart';

void main() {
  final modelWithProvider = {
    "id": "5f9ab228d73408ce4ff2c66c",
    "username": "RatakondalaArun",
    "displayName": "Ratakondala Arun",
    "url": "/RatakondalaArun",
    "avatarUrl": "https://avatars-03.gitter.im/gh/uv/4/RatakondalaArun",
    "avatarUrlSmall":
        "https://avatars1.githubusercontent.com/u/47482264?v=4&s=60",
    "avatarUrlMedium":
        "https://avatars1.githubusercontent.com/u/47482264?v=4&s=128",
    "providers": ["github"],
    "v": 15,
    "gv": "4"
  };

  // final modelWithOutProvider = {
  //   "id": "5f9ab228d73408ce4ff2c66c",
  //   "username": "RatakondalaArun",
  //   "displayName": "Ratakondala Arun",
  //   "url": "/RatakondalaArun",
  //   "avatarUrl": "https://avatars-03.gitter.im/gh/uv/4/RatakondalaArun",
  //   "avatarUrlSmall":
  //       "https://avatars1.githubusercontent.com/u/47482264?v=4&s=60",
  //   "avatarUrlMedium":
  //       "https://avatars1.githubusercontent.com/u/47482264?v=4&s=128",
  //   "v": 15,
  //   "gv": "4"
  // };
  test('Should convert Map to User Object', () {
    final userWith = User.fromMap(modelWithProvider);
    // final userWithOut = User.fromMap(modelWithOutProvider);
    expect(userWith.toMap(), modelWithProvider);
  });
}
