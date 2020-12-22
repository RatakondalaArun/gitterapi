import 'issue.dart';
import 'mention.dart';
import 'user.dart';

export 'issue.dart';
export 'mention.dart';

class Message {
  ///  ID of the message.
  final String id;

  ///  Original message in plain-text/markdown.
  final String text;

  ///  HTML formatted message.
  final String html;

  ///  ISO formatted date of the message.
  final String sent;

  ///  ISO formatted date of the message if edited.
  final String editedAt;

  ///  (User)[user-resource] that sent the message.
  final User fromUser;

  ///  Boolean that indicates if the current user has read the message.
  final bool unread;

  ///  Number of users that have read the message.
  final int readBy;

  ///  List of URLs present in the message.
  final List<String> urls;

  ///  List of @Mentions in the message.
  final List<Mention> mentions;

  ///  List of #Issues referenced in the message.
  final List<Issue> issues;

  ///  Metadata. This is currently not used for anything.
  final Map meta;

  ///  Version.
  final int v;

  ///  Stands for "Gravatar version" and is used for cache busting.
  final String gv;

  ///  Boolean that indicates whether the message is a status update (a /me command)
  final bool status;

  DateTime get sentAs => DateTime.tryParse(sent);

  DateTime get editedAtAs => DateTime.tryParse(editedAt);

  const Message({
    this.id,
    this.text,
    this.html,
    this.sent,
    this.editedAt,
    this.fromUser,
    this.unread,
    this.readBy,
    this.urls,
    this.mentions,
    this.issues,
    this.meta,
    this.v,
    this.gv,
    this.status,
  });

  factory Message.fromMap(Map map) {
    return Message(
      id: map['id'],
      text: map['text'],
      html: map['html'],
      sent: map['sent'],
      editedAt: map['editedAt'],
      fromUser: User.fromMap(map['fromUser']),
      unread: map['unread'],
      readBy: map['readBy'],
      urls: List.castFrom<dynamic, String>(map['urls']),
      mentions: map['mentions']?.map((m) => Mention.fromMap(m))?.toList() ?? [],
      issues: map['issues']?.map((m) => Issue.fromMap(m))?.toList() ?? [],
      meta: map['meta'],
      v: map['v'],
      gv: map['gv'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'html': html,
      'sent': sent,
      'editedAt': editedAt,
      'fromUser': fromUser.toMap(),
      'unread': unread,
      'readBy': readBy,
      'urls': urls,
      'mentions': mentions?.map((m) => m.toMap())?.toList() ?? [],
      'issues': issues?.map((m) => m.toMap())?.toList() ?? [],
      'meta': meta,
      'v': v,
      'gv': gv,
      'status': status,
    };
  }

  Message copyWith({
    String id,
    String text,
    String html,
    String sent,
    String editedAt,
    User fromUser,
    bool unread,
    int readBy,
    List<String> urls,
    List<Mention> mentions,
    List<Issue> issues,
    Map meta,
    int v,
    String gv,
    bool status,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      html: html ?? this.html,
      sent: sent ?? this.sent,
      editedAt: editedAt ?? this.editedAt,
      fromUser: fromUser ?? this.fromUser,
      unread: unread ?? this.unread,
      readBy: readBy ?? this.readBy,
      urls: urls ?? this.urls,
      mentions: mentions ?? this.mentions,
      issues: issues ?? this.issues,
      meta: meta ?? this.meta,
      v: v ?? this.v,
      gv: gv ?? this.gv,
      status: status ?? this.status,
    );
  }
}
