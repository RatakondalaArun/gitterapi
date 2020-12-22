class Issue {
  final String number;

  const Issue({
    this.number,
  });

  factory Issue.fromMap(Map map) {
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
}
