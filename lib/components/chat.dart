import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/message.dart';

class Chat extends StatelessWidget {
  final List messages;
  final String user;
  const Chat({super.key, required this.messages, required this.user});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
            children: messages
                .map((e) => MessageView(message: e, chatUser: user))
                .toList()),
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  final Message message; //the message itself
  final String chatUser; //the user that is viewing the chat
  const MessageView({super.key, required this.message, required this.chatUser});
  @override
  Widget build(BuildContext context) {
    var alignment = MainAxisAlignment.start;
    if (message.username == chatUser) {
      alignment = MainAxisAlignment.end;
    }
    return Row(
      mainAxisAlignment: alignment,
      children: [MessageBlob(message: message)],
    );
  }
}

class MessageBlob extends StatelessWidget {
  final Message message;
  const MessageBlob({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.username,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              message.data,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
