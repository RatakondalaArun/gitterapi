/// Represents a issue.
class Issue {
  /// Issues number that was mentioned.
  final String number;

  /// Creates a instance of [Issue].
  const Issue({
    this.number,
  });

  factory Issue.fromMap(Map map) {
    if (map == null) return null;
    return Issue(
      number: map['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
    };
  }

  Issue copyWith({String number}) {
    return Issue(number: number ?? this.number);
  }

  @override
  String toString() => 'Issue(number: $number)';
}
