import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: Colors.yellow),
        ),
      ],
    );
  }
}
