import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/user_card.dart';

import '../components/app_scaffold.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  List<Widget> cards = [
    UserCard(
      name: "Juan",
      pfp: Image.asset("assets/512x512.png"),
      description: "Amo el no estudiar",
      prosArray: ["Misma universidad", "Le gusta la pizza"],
    ),
    UserCard(
      name: "Pedro",
      pfp: Image.asset("assets/512x512.png"),
      description: "dale que se aprueba wacho",
      prosArray: ["Vive a 3km", "Cursa algebra"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: 512.0,
                child: AppinioSwiper(
                  loop: true,
                  cardsBuilder: (context, index) => cards[index],
                  cardsCount: cards.length,
                  swipeOptions: AppinioSwipeOptions.horizontal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
