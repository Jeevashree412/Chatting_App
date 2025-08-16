import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = const [
      ('alice', 'Alice'),
      ('bob', 'Bob'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: [
          for (final (id, name) in contacts)
            ListTile(
              leading: CircleAvatar(child: Text(name[0])),
              title: Text(name),
              onTap: () => context.go('/chats/dm_$id?title=$name'),
            )
        ],
      ),
    );
  }
}
