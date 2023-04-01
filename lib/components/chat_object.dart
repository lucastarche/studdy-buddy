import 'package:flutter/material.dart';

class ChatObject {
  final List messages;
  final String chatName;
  final String user;
  final CircleAvatar chatPhoto;
  const ChatObject(
      {required this.messages,
      required this.chatName,
      required this.user,
      required this.chatPhoto});
}
