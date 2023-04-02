import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/chat_object.dart';
import 'components/message.dart';
import 'components/settings_object.dart';
import 'components/user_card_object.dart';

class AppState extends ChangeNotifier {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  void init() {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }

      print(_loggedIn);
      notifyListeners();
    });
  }

  //general
  var pfpSmall = const NetworkImage('http://via.placeholder/100x100',
      headers: {'X-Requested-With': 'XMLHttpRequest'});
  //Chat Basic
  // ignore: prefer_const_constructors
  final dummyPhoto = CircleAvatar(
    backgroundImage: const NetworkImage('http://via.placeholder/100x100',
        headers: {'X-Requested-With': 'XMLHttpRequest'}),
  );
  //Card Basic
  final bigPhoto = Image.asset("assets/carlos.jpg");
  //user information and preferences variables
  var email = 'charlescharles@gmail.com';
  var username = 'carlitos';
  var emailNotificationsEnabled = false;
  var pushNotificationsEnabled = false;
  var restrictByInstitution = false;
  var schedule = List.generate(7, (day) => List.filled(24, 1));
  var subjects = [
    'analisis 1',
    'matematica 200',
    'introduccion al pensamiento cientifico'
  ];
  var maxDistance = 4.0;
  ////////////
  late final List<ChatObject> chats;
  late final List<UserCardObject> cards;
  var sobj;

  AppState() {
    init();

    //Chat
    chats = [
      ChatObject(
        messages: [
          Message(
            data: "hola",
            username: "carlitos",
            chatPhoto: dummyPhoto,
          ),
          Message(
            data: "hola carlitos",
            username: "elsantodel90",
            chatPhoto: dummyPhoto,
          ),
        ],
        chatName: 'chat con agustin',
        user: 'carlitos',
        chatPhoto: dummyPhoto,
      ),
      ChatObject(
        messages: [
          Message(
            data: "hola",
            username: "carlitos",
            chatPhoto: dummyPhoto,
          ),
          Message(
            data: "hola carlitos",
            username: "elsantodel90",
            chatPhoto: dummyPhoto,
          ),
        ],
        chatName: 'chat con agustin 2',
        user: 'carlitos',
        chatPhoto: dummyPhoto,
      ),
    ];
    //Home
    cards = [
      UserCardObject(
        name: 'Carlos Miguel Soto, 21',
        pfp: bigPhoto,
        description:
            'Hola mi nombre es Carlos y soy un apasionado de las ciencias de la computacion, estoy cursando en FCEN y espero graduarme pronto. Con mi equipo fuimos ICPC LATAM Champions',
        prosArray: [
          'Va a la misma universidad que vos',
          'Vive a 5km',
          'Cursa Analisis',
          'Le gusta el Ajedrez'
        ],
        schedule: schedule
            .map((row) => row
                .map((value) => value == 0
                    ? (Random().nextBool() ? 1 : 0)
                    : (Random().nextBool() ? 0 : 1))
                .toList())
            .toList(),
      ),
    ];
    //Settings
    sobj = SettingsObject(
      email: email,
      username: username,
      emailNotificationsEnabled: emailNotificationsEnabled,
      pushNotificationsEnabled: pushNotificationsEnabled,
      restrictByInstitution: restrictByInstitution,
      subjects: subjects,
      maxDistance: maxDistance,
      profilePicture: pfpSmall,
    );
  }

  void addMessageToChat(int chatInd, Message newMessage) {
    chats[chatInd].messages.add(newMessage);
    notifyListeners();
  }

  void updateSettingsObject() {
    sobj = SettingsObject(
      email: email,
      username: username,
      emailNotificationsEnabled: emailNotificationsEnabled,
      pushNotificationsEnabled: pushNotificationsEnabled,
      restrictByInstitution: restrictByInstitution,
      subjects: subjects,
      maxDistance: maxDistance,
      profilePicture: pfpSmall,
    );
    notifyListeners();
  }

  void updateUserInformation(BuildContext context, User user) {
    username = user.displayName.toString();
    email = user.email.toString();
    pfpSmall = NetworkImage(
        'https://cors-anywhere.herokuapp.com/${user.photoURL}',
        headers: {'X-Requested-With': 'XMLHttpRequest'});
    updateSettingsObject();
  }

  void toggleSlot(String day, int slot) {
    var days = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado',
      'Domingo'
    ];
    //get index of day
    var dayInd = days.indexOf(day);
    schedule[dayInd][slot - 1] = 1 - schedule[dayInd][slot - 1];
    updateSettingsObject();
  }
}
