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

  Provider copyWith({
    String name,
  }) {
    return Provider(
      name: name ?? this.name,
    );
  }

  @override
  String toString() => 'Provider(name: $name)';
}
