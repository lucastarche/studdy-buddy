import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String name; //name of the person
  final Image pfp; //profile picture
  final String description; //description
  final List prosArray; //array of common attributes
  const UserCard(
      {super.key,
      required this.name,
      required this.pfp,
      required this.description,
      required this.prosArray});

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
      elevation: 10,
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          ImageAndName(
            style: style,
            name: widget.name,
            image: widget.pfp,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UserInformation(
              description: widget.description,
              prosArray: widget.prosArray,
            ),
          ),
        ],
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
