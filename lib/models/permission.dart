import 'dart:convert';

class Permissions {
  final bool admin;

  Permissions({
    this.admin,
  });

  Permissions copyWith({
    bool admin,
  }) {
    return Permissions(
      admin: admin ?? this.admin,
    );
  }

  @override
  String toString() => 'Permission(admin: $admin)';

  Map<String, dynamic> toMap() {
    return {
      'admin': admin,
    };
  }

  factory Permissions.fromMap(Map map) {
    if (map == null) return null;

    return Permissions(
      admin: map['admin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Permissions.fromJson(String source) =>
      Permissions.fromMap(json.decode(source));
}
