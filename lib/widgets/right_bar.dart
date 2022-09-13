import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: barWidth,
          height: 25,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              color: Colors.black),
        ),
      ],
    );
  }
}
