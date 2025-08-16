import 'package:flutter/material.dart';
import 'package:intl/intl.dart';   // ✅ fixed import
import '../../../models/chat_message.dart';
import '../../../services/firestore_service.dart';
import '../../../services/auth_service.dart';

class ChatThreadPage extends StatefulWidget {
  final String threadId;
  final String? title;
  const ChatThreadPage({super.key, required this.threadId, this.title});

  @override
  State<ChatThreadPage> createState() => _ChatThreadPageState();
}

class _ChatThreadPageState extends State<ChatThreadPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthService.signInAnon(); // demo: sign in anon
  }

  @override
  Widget build(BuildContext context) {
    final uid = AuthService.currentUser?.uid ?? 'guest';
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? widget.threadId)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ChatMessage>>(
              stream: FirestoreService.watchMessages(widget.threadId),
              builder: (context, snap) {
                final msgs = snap.data ?? [];
                if (msgs.isEmpty) {
                  return const Center(child: Text("No messages yet"));
                }
                return ListView.builder(
                  reverse: true,
                  itemCount: msgs.length,
                  itemBuilder: (c, i) {
                    final m = msgs[i];
                    final isMe = m.senderId == uid;
                    return ListTile(
                      title: Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.indigo.shade100 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(m.text),
                              Text(
                                DateFormat('hh:mm a').format(m.sentAt.toLocal()),
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onLongPress: isMe
                          ? () => FirestoreService.deleteMessage(widget.threadId, m.id)
                          : null,
                    );
                  },
                );
              },
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Message...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    final txt = _controller.text.trim();
                    if (txt.isEmpty) return;
                    await FirestoreService.sendMessage(widget.threadId, txt, uid);
                    _controller.clear();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
