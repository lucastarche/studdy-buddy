import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'user_card_object.dart';

class UserCard extends StatefulWidget {
  final UserCardObject cardBuilder;
  const UserCard({super.key, required this.cardBuilder});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final FlipCardController _controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: Colors.white,
      fontSize: 30,
    );

    final cardFront = GestureDetector(
      onDoubleTap: () => _controller.toggleCard(),
      child: Column(
        children: [
          ImageAndName(
            style: style,
            name: widget.cardBuilder.name,
            image: widget.cardBuilder.pfp,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UserInformation(
              description: widget.cardBuilder.description,
              prosArray: widget.cardBuilder.prosArray,
            ),
          ),
        ],
      ),
    );

    final cardBack = GestureDetector(
      onDoubleTap: () => _controller.toggleCard(),
      child: const Center(child: Text("Back")),
    );

    return FlipCard(
      front: Card(
        elevation: 10,
        color: Colors.white,
        margin: EdgeInsets.zero,
        child: cardFront,
      ),
      back: Card(
          elevation: 10,
          color: Colors.white,
          margin: EdgeInsets.zero,
          child: cardBack,
      ),
    );
  }
}

class ImageAndName extends StatelessWidget {
  final String name;
  final Image image;
  final TextStyle style;
  const ImageAndName({
    super.key,
    required this.name,
    required this.image,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: image,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            name,
            style: style.copyWith(shadows: [
              const Shadow(
                blurRadius: 4.0,
                color: Colors.black,
                offset: Offset(2, 2),
              ),
            ]),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

class UserInformation extends StatelessWidget {
  final String description;
  final List prosArray;
  const UserInformation(
      {super.key, required this.description, required this.prosArray});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 5,
          child: Text(
            description,
            softWrap: true,
          ),
        ),
        const Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: SizedBox(
            width: 1,
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 5,
          child: Wrap(
            runSpacing: 10,
            children: prosArray.map((e) => Tick(label: e)).toList(),
          ),
        ),
      ],
    );
  }
}

class Tick extends StatelessWidget {
  final String label;
  const Tick({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      avatar: const Icon(Icons.check, color: Colors.black),
    );
  }
}
