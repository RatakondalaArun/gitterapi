import 'package:test/test.dart';
import 'package:gitterapi/models.dart' show UserProfile;

void main() {
  group('This tests github profile', () {
    final ghProfile = {
      "id": "5f9ab228d73408ce4ff2c66c",
      "username": "RatakondalaArun",
      "displayName": "Ratakondala Arun",
      "has_gitter_login": true,
      "company": null,
      "location": "Chennai, India",
      "email": "ratakondalaarun@gmail.com",
      "website": "https://ratakondalaarun.github.io/portfolio/",
      "profile": "https://github.com/RatakondalaArun",
      "github": {"followers": 5, "public_repos": 14, "following": 3},
      "gv": "4",
      "gravatarImageUrl": null
    };

    final glProfile = {
      "id": "5e95ae5dd73408ce4fe06253",
      "username": "tmiquel_loft_gitlab",
      "displayName": "Thibaut Miquel",
      "has_gitter_login": true,
      "gravatarImageUrl":
          "https://secure.gravatar.com/avatar/2aef431ce9f855e2b6f695a05054c9ae?s=80&d=identicon"
    };
    test('Should convert Map to ', () async {
      final convertedGH = UserProfile.fromMap(ghProfile);
      // final convertedGL = UserProfile.fromMap(glProfile);

      expect(
        convertedGH.toMap(),
        ghProfile,
        reason: 'GH profile does not match.',
      );
      // expect(
      //   convertedGL.toMap(),
      //   contains(glProfile),
      //   reason: 'GL profile does not match.',
      // );
    });
  });
}
