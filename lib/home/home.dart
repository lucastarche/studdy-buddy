import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';

import '../components/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                UserCard(
                  name: "Charles Miguel Soto, 20",
                  pfp: Image.network('http://via.placeholder.com/500x600'),
                  description:
                      '''Soy un estudiante universitario de ingeniería informática apasionado por la tecnología y su capacidad para transformar el mundo. Actualmente, estoy en mi último año de carrera y espero graduarme próximamente.''',
                  prosArray: const [
                    "misma universidad",
                    "no misma universidad",
                    "no se que poner",
                    "se que poner"
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
