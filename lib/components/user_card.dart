import 'package:flutter/material.dart';
import 'user_card_object.dart';

class UserCard extends StatefulWidget {
  final UserCardObject cardBuilder;
  const UserCard({super.key, required this.cardBuilder});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: Colors.white,
      fontSize: 30,
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      margin: const EdgeInsets.all(30),
      color: Colors.white,
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ImageAndName(
                  style: style,
                  name: widget.cardBuilder.name,
                  image: widget.cardBuilder.pfp),
              const SizedBox(
                height: 15,
              ),
              UserInformation(
                  description: widget.cardBuilder.description,
                  prosArray: widget.cardBuilder.prosArray)
            ],
          ),
        ),
      ),
    );
  }
}

class ImageAndName extends StatelessWidget {
  final String name;
  final Image image;
  final TextStyle style;
  const ImageAndName(
      {super.key,
      required this.name,
      required this.image,
      required this.style});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: image),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              name,
              style: style,
              softWrap: true,
            ),
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
            )),
        Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: Wrap(
              runSpacing: 10,
              children: prosArray.map((e) => Tick(label: e)).toList(),
            )),
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
