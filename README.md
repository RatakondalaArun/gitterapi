# Gitter API Dart Warpper

A Dart client library for accessing [Gitter API](https://developer.gitter.im/docs/welcome).

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
