part of gitterapi;

/// Abstract of any resource
abstract class Resource<V extends Version> {
  /// Root path of this resource
  final String _path;

  /// Returns a Instance of An Subclass of
  /// type [Version].
  ///
  /// This instance contains methods which are
  /// specific to that Version subclass.
  final V _v;

  /// `v` must not be null.
  Resource(this._v, this._path);
}
