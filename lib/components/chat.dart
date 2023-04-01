import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/chat_object.dart';
import 'package:studdy_buddy/components/message.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';

class Chat extends StatelessWidget {
  final int chatInd;

  const Chat({
    super.key,
    required this.chatInd,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    var chatObject = state.chats[chatInd];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          chatObject.chatName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: chatObject.messages
              .map((e) => MessageView(message: e, chatUser: chatObject.user))
              .toList(),
        ),
      ),
      bottomNavigationBar: TextInput(
        chatInd: chatInd,
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

class TextInput extends StatelessWidget {
  final int chatInd;
  final textEditingController = TextEditingController();

  TextInput({super.key, required this.chatInd});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    var chatObject = state.chats[chatInd];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 60.0,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration:
                  const InputDecoration.collapsed(hintText: "Type a message"),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle sending message
              //create the message
              var newMessage = Message(
                  data: textEditingController.text,
                  username: chatObject.user,
                  chatPhoto: chatObject.chatPhoto);
              state.addMessageToChat(chatInd, newMessage);
            },
          ),
        ],
      ),
    );
  }
}
