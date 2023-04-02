import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/components/user_card.dart';
import 'package:studdy_buddy/app_state.dart';

import '../components/app_scaffold.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final cards = state.cards;
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
                  cardsBuilder: (context, index) =>
                      UserCard(cardBuilder: cards[index]),
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
