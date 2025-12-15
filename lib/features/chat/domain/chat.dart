class Chat {
  final String chatId;
  final String itemId;
  final List<String> participants;
  final String finderUid;
  final String? otherUid;
  final String itemTitle;
  final String? itemMainPhotoUrl;
  final String? lastMessage;
  final String? lastSenderUid;
  final DateTime? lastMessageAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isClosed;
  final DateTime? closedAt;

  const Chat({
    required this.chatId,
    required this.itemId,
    required this.participants,
    required this.finderUid,
    this.otherUid,
    required this.itemTitle,
    this.itemMainPhotoUrl,
    this.lastMessage,
    this.lastSenderUid,
    this.lastMessageAt,
    this.createdAt,
    this.updatedAt,
    this.isClosed = false,
    this.closedAt,
  });

  factory Chat.fromMap(String chatId, Map<String, dynamic> data) {
    final participantsDynamic = data['participants'] as List<dynamic>? ?? [];
    final participants =
        participantsDynamic.map((e) => e.toString()).toList(growable: false);

    DateTime? _toDateTime(dynamic value) {
      if (value == null) return null;
      // Support both Timestamp (from Firestore) and ISO strings if present.
      if (value is DateTime) return value;
      final dynamic ts = value;
      if (ts is dynamic && ts is! DateTime) {
        try {
          // Firestore Timestamp has a toDate() method.
          final toDate = ts.toDate();
          if (toDate is DateTime) return toDate;
        } catch (_) {
          // Fallback to parse if it's a string.
          if (ts is String) {
            return DateTime.tryParse(ts);
          }
        }
      }
      return null;
    }

    return Chat(
      chatId: chatId,
      itemId: (data['itemId'] as String?) ?? '',
      participants: participants,
      finderUid: (data['finderUid'] as String?) ?? '',
      otherUid: data['otherUid'] as String?,
      itemTitle: (data['itemTitle'] as String?) ?? '',
      itemMainPhotoUrl: data['itemMainPhotoUrl'] as String?,
      lastMessage: data['lastMessage'] as String?,
      lastSenderUid: data['lastSenderUid'] as String?,
      lastMessageAt: _toDateTime(data['lastMessageAt']),
      createdAt: _toDateTime(data['createdAt']),
      updatedAt: _toDateTime(data['updatedAt']),
      isClosed: (data['isClosed'] as bool?) ?? false,
      closedAt: _toDateTime(data['closedAt']),
    );
  }
}

