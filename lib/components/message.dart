import 'package:flutter/material.dart';

class Message {
  final String data;
  final String username;
  final CircleAvatar chatPhoto;
  const Message(
      {required this.data, required this.username, required this.chatPhoto});
}
