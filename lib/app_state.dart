import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/chat_object.dart';
import 'package:studdy_buddy/components/message.dart';
import 'package:studdy_buddy/components/settings_object.dart';
import 'package:studdy_buddy/components/user_card_object.dart';

class AppState extends ChangeNotifier {
  //general
  final pfpSmall = const NetworkImage('https://via.placerholder/100x100');
  //Chat Basic
  final dummyPhoto = const CircleAvatar(
    backgroundImage: NetworkImage('https://via.placerholder/100x100'),
  );
  //Card Basic
  final bigPhoto =
      const Image(image: NetworkImage('http://via.placeholder/512x512'));

  late final List<ChatObject> chats;
  late final List<UserCardObject> cards;
  late final SettingsObject sobj;

  AppState() {
    //Chat
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
    //Home
    cards = [
      UserCardObject(
          name: 'carlos',
          pfp: bigPhoto,
          description: 'hola soy carlos',
          prosArray: ['soy crack', 'soy muy crack']),
    ];
    //Settings
    sobj = SettingsObject(
      email: 'charlescharles@gmail.com',
      username: 'carlitos',
      emailNotificationsEnabled: false,
      pushNotificationsEnabled: false,
      restrictByInstitution: false,
      subjects: [
        'analisis 1',
        'matematica 200',
        'introduccion al pensamiento cientifico'
      ],
      maxDistance: 4,
      profilePicture: pfpSmall,
    );
  }
}
