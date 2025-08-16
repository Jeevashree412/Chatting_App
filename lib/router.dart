import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/chats/pages/chats_page.dart';
import 'features/chats/pages/chat_thread_page.dart';
import 'features/contacts/pages/contacts_page.dart';
import 'features/settings/pages/settings_page.dart';

GoRouter createRouter() {
  int calcIndex(String loc) {
    if (loc.startsWith('/contacts')) return 1;
    if (loc.startsWith('/settings')) return 2;
    return 0;
  }

  return GoRouter(
    initialLocation: '/chats',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final currentIndex = calcIndex(state.uri.toString());
          return Scaffold(
            body: SafeArea(child: child),
            bottomNavigationBar: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.go('/chats');
                    break;
                  case 1:
                    context.go('/contacts');
                    break;
                  case 2:
                    context.go('/settings');
                    break;
                }
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.chat), label: 'Chats'),
                NavigationDestination(icon: Icon(Icons.people), label: 'Contacts'),
                NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/chats',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ChatsPage()),
            routes: [
              GoRoute(
                path: ':threadId',
                name: 'thread',
                builder: (context, state) {
                  final id = state.pathParameters['threadId']!;
                  final title = state.uri.queryParameters['title'];
                  return ChatThreadPage(threadId: id, title: title);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/contacts',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ContactsPage()),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsPage()),
          ),
        ],
      ),
    ],
  );
}
 


 
