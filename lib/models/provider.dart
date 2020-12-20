import 'dart:convert';

class Provider {
  final String name;

  Provider({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Provider.fromMap(Map map) {
    if (map == null) return null;

    return Provider(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Provider.fromJson(String source) =>
      Provider.fromMap(json.decode(source));

  Provider copyWith({
    String name,
  }) {
    return Provider(
      name: name ?? this.name,
    );
  }

  @override
  String toString() => 'Provider(name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Provider && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
