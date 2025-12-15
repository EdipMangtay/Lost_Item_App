import 'package:campus_lost_found/core/widgets/empty_state.dart';
import 'package:campus_lost_found/features/chat/domain/chat.dart';
import 'package:campus_lost_found/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MessagesPage extends ConsumerWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserAsync = ref.watch(currentUserProvider);

    return currentUserAsync.when(
      data: (user) {
        if (user == null) {
          return const Scaffold(
            body: Center(
              child: Text('Sign in to view your conversations.'),
            ),
          );
        }

        final chatsAsync = ref.watch(userChatsProvider(user.uid));

        return Scaffold(
          appBar: AppBar(
            title: const Text('Messages'),
          ),
          body: chatsAsync.when(
            data: (chats) => _MessagesList(
              chats: chats,
              currentUid: user.uid,
            ),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (_, __) => const Center(
              child: Text('Failed to load conversations'),
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      ),
      error: (_, __) => const Scaffold(
        body: Center(child: Text('Failed to load user')),
      ),
    );
  }
}

class _MessagesList extends StatelessWidget {
  final List<Chat> chats;
  final String currentUid;

  const _MessagesList({
    required this.chats,
    required this.currentUid,
  });

  @override
  Widget build(BuildContext context) {
    if (chats.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: EmptyState(
          icon: '💬',
          title: 'No conversations yet',
          subtitle: 'Open an item and start a chat with the finder to see it here.',
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: chats.length,
      separatorBuilder: (_, __) => const Divider(height: 0),
      itemBuilder: (context, index) {
        final chat = chats[index];
        final lastMessage = chat.lastMessage ?? 'No messages yet';
        final timeText = chat.lastMessageAt != null
            ? TimeOfDay.fromDateTime(chat.lastMessageAt!).format(context)
            : '';
        final isUnread = chat.lastSenderUid != null &&
            chat.lastSenderUid!.isNotEmpty &&
            chat.lastSenderUid != currentUid;

        return ListTile(
          leading: CircleAvatar(
            child: Text(
              chat.itemTitle.isNotEmpty
                  ? chat.itemTitle[0].toUpperCase()
                  : '?',
            ),
          ),
          title: Text(
            chat.itemTitle.isNotEmpty ? chat.itemTitle : 'Conversation',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                timeText,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              if (isUnread) ...[
                const SizedBox(height: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
          onTap: () {
            // Reuse existing item-based chat route.
            context.push('/item/${chat.itemId}/chat');
          },
        );
      },
    );
  }
}

