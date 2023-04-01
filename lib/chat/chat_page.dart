import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        child: Wrap(
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
          runSpacing: 8.0,
        ),
      ),
    );
  }
}

class ChatOption extends StatelessWidget {
  final String username;

  const ChatOption({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("http://via.placeholder.com/64x64"),
            radius: 32.0,
          ),
          SizedBox(
            width: 95.0,
          ),
          Text(username),
        ],
      ),
      color: Colors.greenAccent,
      alignment: Alignment.centerLeft,
    );
  }
}
