part of gitterapi;

/// Abstract of Version
abstract class Version {
  /// instance of [GitterApi].
  GitterApi _api;

  /// Specify the version .
  ///
  /// Must not be null.
  /// ```
  /// @override
  /// String get version => 'v1';
  /// ```
  String get version;

  /// Returns a instance of [GitterApi]
  GitterApi get api => _api;

  /// `api` must not be null
  Version(GitterApi api) : _api = api;
}
