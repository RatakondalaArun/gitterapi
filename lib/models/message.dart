import 'issue.dart';
import 'mention.dart';
import 'user.dart';

/// Represents a Message.
class Message {
  ///  ID of the message.
  final String id;

  ///  Original message in plain-text/markdown.
  final String text;

  ///  HTML formatted message.
  final String html;

  ///  ISO formatted date of the message.
  final String sent;

  /// Count of number of thread messages this message has.
  /// This will be null if this is child(thread).
  final int threadMessageCount;

  /// Id of the parent message. If this is a thread message
  /// else null.
  final String parentId;

  ///  ISO formatted date of the message if edited.
  final String editedAt;

  ///  (User) that sent the message.
  final User fromUser;

  ///  Boolean that indicates if the current user has read the message.
  final bool unread;

  ///  Number of users that have read the message.
  final int readBy;

  ///  List of URLs present in the message.
  final List<Map> urls;

  ///  List of @Mentions in the message.
  final List<Mention> mentions;

  ///  List of #Issues referenced in the message.
  final List<Issue> issues;

  ///  Metadata. This is currently not used for anything.
  final List<dynamic> meta;

  /// Converts [sent] to [DateTime].
  DateTime get sentAs {
    return sent == null ? null : DateTime.tryParse(sent);
  }

  /// Converts [editedAt] to [DateTime].
  DateTime get editedAtAs {
    return editedAt == null ? null : DateTime.tryParse(editedAt);
  }

  /// Returns true if this is a parent.
  bool get isParent => parentId != null;

  /// Returns true if this is a child thread.
  bool get isChild => parentId == null;

  /// Creates a instance of [Message].
  const Message({
    this.id,
    this.text,
    this.html,
    this.sent,
    this.threadMessageCount,
    this.parentId,
    this.editedAt,
    this.fromUser,
    this.unread,
    this.readBy,
    this.urls,
    this.mentions,
    this.issues,
    this.meta,
  });

  factory Message.fromMap(Map map) {
    if (map == null) return null;
    return Message(
      id: map['id'],
      text: map['text'],
      html: map['html'],
      sent: map['sent'],
      threadMessageCount: map['threadMessageCount'],
      parentId: map['parentId'],
      editedAt: map['editedAt'],
      fromUser: User.fromMap(map['fromUser']),
      unread: map['unread'],
      readBy: map['readBy'],
      urls: List.castFrom<dynamic, Map>(map['urls'] ?? []),
      mentions: List.from(map['mentions'] ?? [])
          .map<Mention>((m) => Mention.fromMap(m as Map))
          .toList(),
      issues: List.from(map['issues'] ?? [])
          .map<Issue>((m) => Issue.fromMap(m))
          .toList(),
      meta: map['meta'] ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'html': html,
      'sent': sent,
      'parentId': parentId,
      'threadMessageCount': threadMessageCount,
      'editedAt': editedAt,
      'fromUser': fromUser?.toMap(),
      'unread': unread,
      'readBy': readBy,
      'urls': urls,
      'mentions': mentions?.map((m) => m?.toMap())?.toList() ?? <Map>[],
      'issues': issues?.map((m) => m?.toMap())?.toList() ?? <Map>[],
      'meta': meta,
    };
  }

  Message copyWith({
    String id,
    String text,
    String html,
    String sent,
    int threadMessageCount,
    String parentId,
    String editedAt,
    User fromUser,
    bool unread,
    int readBy,
    List<Map> urls,
    List<Mention> mentions,
    List<Issue> issues,
    List<dynamic> meta,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      html: html ?? this.html,
      sent: sent ?? this.sent,
      threadMessageCount: threadMessageCount ?? this.threadMessageCount,
      parentId: parentId ?? this.parentId,
      editedAt: editedAt ?? this.editedAt,
      fromUser: fromUser ?? this.fromUser,
      unread: unread ?? this.unread,
      readBy: readBy ?? this.readBy,
      urls: urls ?? this.urls,
      mentions: mentions ?? this.mentions,
      issues: issues ?? this.issues,
      meta: meta ?? this.meta,
    );
  }

  @override
  String toString() {
    return 'Message(\n ${toMap()} \n)';
  }
}
