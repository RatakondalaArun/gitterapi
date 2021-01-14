part of gitterapi;

/// Creates methods for [Messages-resource](https://developer.gitter.im/docs/messages-resource).
class MessagesResource extends Resource<V1> {
  MessagesResource(V1 v) : super(v, 'chatMessages');

  /// List of messages in a room.
  /// Returns [List<Map<String,dynamic>>].
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `skip`: Skip n messages (constrained to 5000 or less).
  /// - `beforeId`: Get messages before beforeId.
  /// - `afterId`: Get messages after afterId.
  /// - `aroundId`: Get messages around aroundId including this message.
  /// - `limit`: Maximum number of messages to return (constrained to 100 or less).
  /// - `q`: Search query.
  ///
  Future<Result<List<dynamic>>> getMessages(
    String roomId, {
    int skip,
    String beforeId,
    String afterId,
    String aroundId,
    int limit = 50,
    String query,
  }) {
    return _v._jsonRequest<List>(
      'rooms/$roomId/$_path',
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
  ///
  /// ### Parameters:
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`: Id of the message.
  ///
  Future<Result<Map>> getSingleMessage(String roomId, String messageId) {
    return _v._jsonRequest<Map>('rooms/$roomId/$_path/$messageId');
  }

  /// Send a message to a room.
  ///
  /// ### Parameters
  ///
  /// - `text`: Required Body of the message.
  /// - `status`: Boolean, set to true to indicate that the message is a status update (what /me uses)
  ///
  Future<Result<Map>> sendMessage(String roomId, String messageText,
      {bool status}) {
    return _v._jsonRequest<Map>(
      'rooms/$roomId/$_path',
      method: 'POST',
      postData: {
        'text': messageText,
        'statue': status,
      },
    );
  }

  /// Update
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`: Id of the message.
  /// - `text`: Required Body of the message.
  ///
  Future<Result<Map>> updateMessage(
    String roomId,
    String messageId,
    String text,
  ) {
    return _v._jsonRequest<Map>(
      'rooms/$roomId/$_path/$messageId',
      method: 'PUT',
      postData: {
        'text': text,
      },
    );
  }

  /// You can retrieve unread items and
  /// mentions using the following endpoint.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<Map>> getUnreadItems(String userId, String roomId) {
    return _v._jsonRequest<Map>('user/$userId/rooms/$roomId/unreadItems');
  }

  /// There is an additional endpoint nested under
  /// rooms that you can use to mark chat messages as read.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  /// - `chatIds`: [List] of messageId's you want to mark as unread.
  ///
  Future<Result<void>> markMessagesAsRead(
    String userId,
    String roomId, {
    List<String> chatIds = const [],
  }) {
    return _v._jsonRequest(
      'user/$userId/rooms/$roomId/unreadItems',
      method: 'POST',
      postData: {
        'chat': chatIds,
      },
    );
  }

  /// Returns list of user read this message.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`: Id of the message.
  ///
  Future<Result<List>> messageReadBy(String roomId, String messageId) {
    return _v._jsonRequest<List>(
      'rooms/$roomId/chatMessage/$messageId/readBy',
    );
  }

  /// Marks all message messages in a room as read.
  ///
  /// ### Parameters
  ///
  /// - `userId`: Id of the user.
  /// - `roomId`: Id of the room.
  ///
  Future<Result<Map>> markAllMessagesAsRead(String userId, String roomId) {
    return _v._jsonRequest(
      'user/$userId/rooms/$roomId/unreadItems/all',
      method: 'DELETE',
    );
  }

  /// Delete a message.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`: Id of the message.
  ///
  Future<Result<Map>> deleteMessage(String roomId, String messageId) {
    return _v._jsonRequest(
      'rooms/$roomId/chatMessages/$messageId',
      method: 'DELETE',
    );
  }

  /// Creates a thread for a message
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `parentId`: Id of the parent message.
  /// Thread will be created under this message.
  /// - `text`: Message text.
  ///
  Future<Result<Map>> createThreadMessage(
    String roomId,
    String parentId,
    String text, {
    bool status = true,
  }) {
    return _v._jsonRequest<Map>(
      'rooms/$roomId/chatMessages/',
      method: 'POST',
      postData: {
        'parentId': parentId,
        'text': text,
        'status': status,
      },
    );
  }

  /// Updates already created message
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`: Id of the message.
  /// - `text`: Message text.
  ///
  Future<Result<Map>> updateThreadMessage(
    String roomId,
    String messageId,
    String text, {
    bool status = true,
  }) {
    return _v._jsonRequest<Map>(
      'rooms/$roomId/chatMessages/$messageId',
      method: 'PUT',
      postData: {
        'text': text,
        'status': status,
      },
    );
  }

  /// Returns a list of Messages that belong to a thread.
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`: Id of the message.
  /// - `limit`: Maximum number of messages to return.
  ///
  Future<Result<List>> getThreadMessages(
    String roomId,
    String messageId, {
    int limit,
  }) {
    return _v._jsonRequest<List>(
      'rooms/$roomId/chatMessages/$messageId/thread',
      queryParameters: {'limit': limit},
    );
  }

  /// Deletes a message under thread
  ///
  /// ### Parameters
  ///
  /// - `roomId`: Id of the room.
  /// - `messageId`:Id of the message that you want to delete.
  ///
  Future<Result<Map>> deleteThreadMessage(String roomId, String messageId) {
    return _v._jsonRequest<Map>(
      '/rooms/$roomId/chatMessages/$messageId',
      method: 'DELETE',
    );
  }
}
