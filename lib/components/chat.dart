import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/message.dart';
import 'package:studdy_buddy/home/home.dart';

class Chat extends StatelessWidget {
  final List messages;
  final String chatName;
  final String user;
  final CircleAvatar chatPhoto;
  const Chat(
      {super.key,
      required this.messages,
      required this.user,
      required this.chatName,
      required this.chatPhoto});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatHeader(title: chatName),
        // other widgets go here
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: ListView(
              children: messages
                  .map((e) => MessageView(message: e, chatUser: user))
                  .toList(),
            ),
          ),
        ),
        const TextInput(),
      ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                message.chatPhoto,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    message.username,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
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

class ChatHeader extends StatelessWidget {
  final String title;

  const ChatHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // handle back button press
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 60.0,
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Type a message"),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle sending message
            },
          ),
        ],
      ),
    );
  }
}
