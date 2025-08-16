import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/chat_message.dart';

class FirestoreService {
  static final _db = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> _messages(String threadId) =>
      _db.collection('threads').doc(threadId).collection('messages');

  static Stream<List<ChatMessage>> watchMessages(String threadId) {
    return _messages(threadId)
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => ChatMessage.fromMap(d.id, d.data())).toList());
  }

  static Future<void> sendMessage(String threadId, String text, String senderId) async {
    await _messages(threadId).add({
      'text': text,
      'senderId': senderId,
      'sentAt': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> deleteMessage(String threadId, String messageId) async {
    await _messages(threadId).doc(messageId).delete();
  }
}
