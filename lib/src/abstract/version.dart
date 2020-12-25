part of gitterapi;

/// Abstract of Version
abstract class Version {
  /// instance of [GitterApi].
  final GitterApi _api;

  /// Specify the version.
  /// Must not be null.
  final String _version;

  /// Returns a instance of [GitterApi]
  GitterApi get api => _api;

  /// `api` must not be null
  Version(GitterApi api, this._version) : _api = api;
}
