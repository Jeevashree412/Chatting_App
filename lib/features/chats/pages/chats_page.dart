import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demoThreads = const [
      ('general', 'General'),
      ('flutter', 'Flutter Help'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: ListView(
        children: [
          for (final (id, title) in demoThreads)
            ListTile(
              title: Text(title),
              onTap: () => context.go('/chats/$id?title=$title'),
            )
        ],
      ),
    );
  }
}
