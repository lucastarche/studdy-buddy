import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';
import 'package:studdy_buddy/components/chat.dart';
import 'package:studdy_buddy/components/message.dart';

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
          children: (chats.map((e) => e.chatName).toList())
              .map((user) => ChatOption(username: user))
              .toList(),
        ),
      ),
    );
  }
}

class ChatOption extends StatelessWidget {
  final String username;

  const ChatOption({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final image =
            CircleAvatar(backgroundImage: AssetImage('assets/64x64.png'));

        Navigator.pushNamed(context, "chatting-with",
            arguments: <String, dynamic>{
              "chatName": username,
              "chatPhoto": image,
              "user": "Lucas",
              "messages": [
                Message(data: "Hola", username: "Lucas", chatPhoto: image),
                Message(data: "Hola", username: username, chatPhoto: image),
              ]
            });
      },
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
            const CircleAvatar(
              backgroundImage: AssetImage("assets/64x64.png"),
              radius: 24.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Text(
                username,
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
