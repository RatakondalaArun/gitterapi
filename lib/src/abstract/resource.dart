part of gitterapi;

/// Abstract of any resource
abstract class Resource<V extends Version> {
  // root path of this resource
  String get path;

  /// Returns a Instance of An Subclass of
  /// type [Version].
  ///
  /// This instance contains methods which are
  /// specific to that Version subclass.
  final V v;

  /// `v` must not be null.
  Resource(this.v);
}
