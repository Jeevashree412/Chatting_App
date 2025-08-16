import 'package:flutter/material.dart';
import '../../../services/auth_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          Text('User: ${AuthService.currentUser?.uid ?? 'guest'}'),
          ElevatedButton(
            onPressed: () async {
              await AuthService.signOut();
              await AuthService.signInAnon();
            },
            child: const Text('Sign out (demo)'),
          ),
        ],
      ),
    );
  }
}
