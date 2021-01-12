# Gitter API Dart Warpper

A Dart client library for accessing [Gitter API](https://developer.gitter.im/docs/welcome).

![CI-Tests](https://github.com/RatakondalaArun/gitterapi/workflows/CI-Tests/badge.svg)
[![Gitter](https://badges.gitter.im/RatakondalaArun/gitterapi.svg)](https://gitter.im/RatakondalaArun/gitterapi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Getting Started

1) Add this to your `pubspec.yaml`

    ```text
    dependencies:
        tmdb_api: recent_version.
    ```

2) Import the package in your code.

    ```dart
    import 'package:gitterapi/gitterapi.dart'
    ```

3) Create instance of `GitterApi`.

   ```dart
   final gitterApi = GitterApi(ApiKeys('ACCESS_TOKEN'));
   ```

### Example

Now use that instance to make api requests.

```dart
final Result<Map> result = await gitterApi.v1.userResource.me(); 
print(result.data);

// you can use models from gitterapi/models.dart to parse this data
final User me = User.fromMap(result.data);
```

---

# 🤝Wanna contributions to this package?

## What you can contribute?

- Add or update unit tests🧪.
- Add or update documentation📝.
- Found a new end point? create a
  [issue](https://github.com/RatakondalaArun/gitterapi/issues/new?template=new_endpoint.md)
  and work on it🔗.
- Check out [good first issues](https://github.com/RatakondalaArun/gitterapi/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)🆕.

## Resources

- [Offical Docs](https://developer.gitter.im/docs/welcome)
- [Unoffical API Docs](https://documenter.getpostman.com/view/9795430/TVzSiwEJ)

Note: *Offical docs was not completely documented*.

## 🔧Setup project for development

1) Fork this repo. Then clone it.

    ```shell
    git clone https://github.com/{YOUR_GITHUB_USERNAME}/gitterapi.git
    ```

2) Install dependencies.

    ```shell
    dart pub get
    ```

3) Create a `.env` file for running tests.

    ```text
    AUTH_TOKEN={YOUR TOKEN}
    USER_ID={YOUR USERID}
    ROOM_ID={SOME ROOM ID}
    CHAT_ROOM_ID={SOME GITTER ROOM ID}
    MESSAGE_ID={SOME MESSAGE ID}
    GROUP_ID={SOME GROUP ID}
    ```

**Now you are ready to contribute.**
