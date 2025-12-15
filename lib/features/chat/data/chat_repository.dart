import 'package:campus_lost_found/features/chat/domain/chat.dart';
import 'package:campus_lost_found/features/chat/domain/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  final FirebaseFirestore _firestore;

  ChatRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _chats =>
      _firestore.collection('chats');

  /// Real-time stream of chat messages for a given chat (by id).
  Stream<List<ChatMessage>> watchMessages(String chatId) {
    return _chats
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return ChatMessage(
          id: doc.id,
          senderUid: data['senderUid'] as String? ?? '',
          text: data['text'] as String? ?? '',
          createdAt:
              (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        );
      }).toList();
    });
  }

  /// Real-time list of all chats a user participates in, ordered by latest activity.
  Stream<List<Chat>> userChatsStream(String uid) {
    return _chats
        .where('participants', arrayContains: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Chat.fromMap(doc.id, doc.data()))
          .toList();
    });
  }

  /// Append a message to a chat and update chat metadata.
  ///
  /// For now we use `itemId` as the chat document id to keep routing simple.
  Future<void> sendMessage({
    required String itemId,
    required String senderUid,
    required String text,
    required String finderUid,
    required String claimantUid,
    required String itemTitle,
  }) async {
    if (text.trim().isEmpty) return;

    final chatId = itemId;
    final chatRef = _chats.doc(chatId);
    final now = FieldValue.serverTimestamp();

    await chatRef.set(
      {
        'itemId': itemId,
        'finderUid': finderUid,
        'claimantUid': claimantUid,
        'participants': [finderUid, claimantUid],
        'itemTitle': itemTitle,
        'lastMessage': text.trim(),
        'lastSenderUid': senderUid,
        'lastMessageAt': now,
        'updatedAt': now,
        'createdAt': now,
        'isClosed': false,
      },
      SetOptions(merge: true),
    );

    await chatRef.collection('messages').add({
      'senderUid': senderUid,
      'text': text.trim(),
      'createdAt': now,
    });
  }
}

