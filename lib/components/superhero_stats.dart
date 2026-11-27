import 'package:flutter/material.dart';

class SuperheroStats extends StatelessWidget {

  final String powerStat;
  final Color statColor;
  final String statTitle;

  const SuperheroStats({super.key, required this.powerStat, required this.statColor, required this.statTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: double.parse(powerStat),
          width: 30,
          color: statColor,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(powerStat)],
            ),
          ),
        ),
        Text(statTitle),
      ],
    );
  }
}
