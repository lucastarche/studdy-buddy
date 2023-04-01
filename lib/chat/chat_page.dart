import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Wrap(
          runSpacing: 8.0,
          children: [
            "Nacho",
            "Lucas",
            "Jere",
            "Nacho",
            "Lucas",
            "Nacho",
            "Lucas",
            "Nacho",
            "Lucas",
            "Nacho",
            "Lucas",
            "Nacho",
            "Lucas"
          ].map((user) => ChatOption(username: user)).toList(),
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
        // Navigator.push(context, MaterialPageRoute(builder: ))
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
              backgroundImage: NetworkImage("http://via.placeholder.com/64x64"),
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
