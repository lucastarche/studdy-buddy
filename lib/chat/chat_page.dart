import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final chats = state.chats;
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Wrap(
          runSpacing: 8.0,
          children: List.generate(
              chats.length, (index) => ChatOption(chatInd: index)),
        ),
      ),
    );
  }
}

class ChatOption extends StatelessWidget {
  final int chatInd;

  const ChatOption({
    Key? key,
    required this.chatInd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final chat = state.chats[chatInd];

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, "chatting-with", arguments: chatInd),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            chat.chatPhoto,
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Text(
                chat.chatName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
