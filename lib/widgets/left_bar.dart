import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: barWidth,
          height: 25,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              color: Colors.black),
        ),
      ],
    );
  }
}
