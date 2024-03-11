import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour, required this.cardChild, required this.onpress});

  final Color colour;
  final Widget cardChild;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration:
            BoxDecoration(color: colour, borderRadius: BorderRadius.circular(15)),
        child: cardChild,
      ),
    );
  }
}
