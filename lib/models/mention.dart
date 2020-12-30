/// Represents mention.
class Mention {
  /// Id of the user that was mentioned.
  final String userId;

  /// Screen name of the user that was mentioned.
  final String screenName;

  /// Creates a instance of [Mention].
  const Mention({
    this.userId,
    this.screenName,
  });

  factory Mention.fromMap(Map map) {
    if (map == null) return null;
    return Mention(
      userId: map['userId'],
      screenName: map['screenName'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'screenName': screenName,
    };
  }

  Mention copyWith({String userId, String screenName}) {
    return Mention(
      userId: userId ?? this.userId,
      screenName: screenName ?? this.screenName,
    );
  }
}
