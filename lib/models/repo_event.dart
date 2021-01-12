// event from a gitlab repo
// {
//         "id": "5fea29b6aa6bb528c37876e8",
//         "text": "[Eric Eastwood](https://gitlab.com/u/MadLittleMods) closed issue [#2705 Command not working](https://gitlab.com/gitterHQ/webapp/-/issues/2705) in [webapp](https://gitlab.com/gitterHQ/webapp)",
//         "html": "<a href=\"https://gitlab.com/u/MadLittleMods\" rel=\"nofollow noopener noreferrer\" target=\"_blank\" class=\"link \">Eric Eastwood</a> closed issue <a target=\"_blank\" data-link-type=\"issue\" data-issue=\"2705\" href=\"https://gitlab.com/gitterHQ/webapp/-/issues/2705\" data-provider=\"gitlab\" data-issue-repo=\"gitterHQ/webapp\" class=\"issue\">gitterHQ/webapp#2705</a> in <a href=\"https://gitlab.com/gitterHQ/webapp\" rel=\"nofollow noopener noreferrer\" target=\"_blank\" class=\"link \">webapp</a>",
//         "sent": "2020-12-28T18:53:42.628Z",
//         "editedAt": null,
//         "meta": {
//             "errorLevel": "normal",
//             "icon": "logo",
//             "prerendered": true,
//             "service": "gitlab",
//             "type": "webhook"
//         },
//         "v": 1
// },

class RepoEvent {
  /// Id of the event
  final String id;

  /// Orginal text of the message( Markdown ).
  final String text;

  /// Same message in html format.
  final String html;

  /// Timestamp of this event.
  final DateTime sent;

  /// Timestamp if this event was edited in UTC format.
  final DateTime editedAt;

  /// Meta
  final Map meta;

  /// Only for github. Contains webhook event payload.
  final Map payload;

  /// version
  final int v;

  /// Creates a instance of [RepoEvent]
  const RepoEvent({
    this.id,
    this.text,
    this.html,
    this.sent,
    this.editedAt,
    this.meta,
    this.payload,
    this.v,
  });

  // Returns true if this event is edited.
  bool get isEdited => editedAt != null;

  // Returns true if this is a github repo.
  bool get isGithubRepo => payload != null;

  factory RepoEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RepoEvent(
      id: map['id'],
      text: map['text'],
      html: map['html'],
      sent: DateTime.tryParse(map['sent'] ?? ''),
      editedAt: DateTime.tryParse(map['editedAt'] ?? ''),
      meta: Map<String, dynamic>.from(map['meta']),
      payload: Map<String, dynamic>.from(map['payload']),
      v: map['v'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'html': html,
      'sent': sent?.toIso8601String(),
      'editedAt': editedAt?.toIso8601String(),
      'meta': meta,
      'payload': payload,
      'v': v,
    };
  }

  RepoEvent copyWith({
    String id,
    String text,
    String html,
    DateTime sent,
    DateTime editedAt,
    Map meta,
    Map payload,
    int v,
  }) {
    return RepoEvent(
      id: id ?? this.id,
      text: text ?? this.text,
      html: html ?? this.html,
      sent: sent ?? this.sent,
      editedAt: editedAt ?? this.editedAt,
      meta: meta ?? this.meta,
      payload: payload ?? this.payload,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'RepoEvent(\n${toMap()}\n)';
  }
}
