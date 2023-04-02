import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/components/chat_object.dart';
import 'package:studdy_buddy/components/user_card.dart';
import 'package:studdy_buddy/app_state.dart';
import 'dart:math';

import '../components/app_scaffold.dart';
import '../components/message.dart';
import '../components/sync.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final swipeController = AppinioSwiperController();

    final state = Provider.of<AppState>(context);
    final theme = Theme.of(context);
    final cards = state.cards;

    var body = SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: 512.0,
      child: AppinioSwiper(
        controller: swipeController,
        loop: true,
        cardsBuilder: (context, index) => UserCard(cardBuilder: cards[index]),
        cardsCount: cards.length,
        swipeOptions: AppinioSwipeOptions.horizontal,
        onSwipe: (index, direction) {
          if (direction == AppinioSwiperDirection.right) {
            final random = Random();
            final randomInt = random.nextInt(4);
            // Do something with the randomInt

            int previousIndex = index - 1;
            if (previousIndex < 0) previousIndex = state.cards.length - 1;

            if (randomInt == 3) {
              _onSyncedWith(context, previousIndex);
              swipeController.unswipe();
            }
          }
        },
      ),
    );

    return AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              (state.cards.isNotEmpty)
                  ? body
                  : Center(
                      child: Text(
                        "No more users to sync with!",
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSyncedWith(BuildContext context, int index) {
    final state = Provider.of<AppState>(context, listen: false);
    final user = state.cards[index];
    final myUser = state.username;

    final imageProvider = user.pfp.image;

    final pfp = CircleAvatar(backgroundImage: imageProvider);

    SyncDialog(
      context: context,
      index: index,
      user: user.name,
      userImage: imageProvider,
    ).show();

    state.chats.add(ChatObject(
      messages: [
        Message(
          username: user.name,
          data: "Hola, soy ${user.name}!",
          chatPhoto: pfp,
        ),
      ],
      chatName: user.name,
      user: myUser,
      chatPhoto: pfp,
      userPhoto: CircleAvatar(backgroundImage: state.pfpSmall),
    ));

    state.removeCard(index);
  }
}
