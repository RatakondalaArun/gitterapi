part of gitterapi;

class MessagesResource extends Resource<V1> {
  MessagesResource(V1 v) : super(v);

  @override
  String get path => 'chatMessages';

  /// List of messages in a room.
  /// Returns [List<Map<String,dynamic>>].
  ///
  /// ### All the parameters are optional:
  ///
  /// - `skip`: Skip n messages (constrained to 5000 or less).
  /// - `beforeId`: Get messages before beforeId.
  /// - `afterId`: Get messages after afterId.
  /// - `aroundId`: Get messages around aroundId including this message.
  /// - `limit`: Maximum number of messages to return (constrained to 100 or less).
  /// - `q`: Search query.
  Future<List<dynamic>> getMessages(
    String roomId, {
    int skip,
    String beforeId,
    String afterId,
    String aroundId,
    int limit = 50,
    String query,
  }) {
    return v.jsonRequest<List>(
      'rooms/$roomId/$path',
      queryParameters: {
        'skip': skip,
        'beforeId': beforeId,
        'afterId': afterId,
        'aroundId': aroundId,
        'limit': limit,
        'q': query,
      },
    );
  }

  /// There is also a way to retrieve a single message using its id.
  Future<Map> getSingleMessage(String roomId, String messageId) {
    return v.jsonRequest<Map>('rooms/$roomId/$path/$messageId');
  }

  /// Send a message to a room.
  ///
  /// - `text`: Required Body of the message.
  /// - `status`: Boolean, set to true to indicate that the message is a status update (what /me uses)
  ///
  Future<void> sendMessage(String roomId, String messageText, {bool status}) {
    return v.jsonRequest<void>(
      'rooms/$roomId/$path',
      method: 'POST',
      postData: {
        'text': messageText,
        'statue': status,
      },
    );
  }

  /// Update a message.
  ///
  /// - `text`: Required Body of the message.
  ///
  /// ### Response
  /// ```
  /// {
  ///   "id": "533171eb7bfc1a0000000012",
  ///   "text": "You should also check https://irc.gitter.im/ <3<3<3",
  ///   "html": "You should also check <a href=\"https://irc.gitter.im/\" rel=\"nofollow\" target=\"_new\" class=\"link\">https://irc.gitter.im/</a> &lt;3&lt;3&lt;3",
  ///   "sent": "2014-03-25T12:09:15.292Z",
  ///   "editedAt": "2014-03-25T12:13:02.985Z",
  ///   "fromUser": {
  ///     "id": "53307734c3599d1de448e192",
  ///     "username": "malditogeek",
  ///     "displayName": "Mauro Pompilio",
  ///     "url": "/malditogeek",
  ///     "avatarUrlSmall": "https://avatars.githubusercontent.com/u/14751?",
  ///     "avatarUrlMedium": "https://avatars.githubusercontent.com/u/14751?"
  ///   },
  ///   "unread": false,
  ///   "readBy": 0,
  ///   "urls": [
  ///     {
  ///       "url": "https://irc.gitter.im/"
  ///     }
  ///   ],
  ///   "mentions": [],
  ///   "issues": [],
  ///   "meta": {},
  ///   "v": 2
  /// }
  /// ```
  Future<Map> updateMessage(String roomId, String messageId, String text) {
    return v.jsonRequest<Map>(
      'rooms/$roomId/$path/$messageId',
      method: 'PUT',
      postData: {
        'text': text,
      },
    );
  }
}
