import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/chat_object.dart';
import 'package:studdy_buddy/components/message.dart';

class AppState extends ChangeNotifier {
  //Chat
  final dummyPhoto = const CircleAvatar(
    backgroundImage: NetworkImage('http://via.placeholder/100x100'),
  );

  late final List<ChatObject> chats;
  //Home
  //Settings

  AppState() {
    chats = [
      ChatObject(
        messages: [
          Message(
            data: "hola",
            username: "carlitos",
            chatPhoto: dummyPhoto,
          ),
        ],
        chatName: 'chat con agustin',
        user: 'carlitos',
        chatPhoto: dummyPhoto,
      ),
    ];
  }
}
