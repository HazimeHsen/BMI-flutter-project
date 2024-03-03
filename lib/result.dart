import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  double height;
  double weight;
  double age;
  bool isMale;

  ResultPage(
      {super.key,
      required this.height,
      required this.weight,
      required this.age,
      required this.isMale});
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    double bmiCalc = widget.weight / pow(widget.height / 100, 2);
    String result = "";

    switch (bmiCalc) {
      case < 16:
        result = "Severe Thinness";
        break;
      case > 16 && < 25:
        result = "Normal";
        break;
      case > 25 && < 30:
        result = "OverWeight";
        break;
      case > 30:
        result = "Obese";
        break;
      default:
    }
    return Scaffold(
        backgroundColor:
            widget.isMale ? Colors.blue.shade400 : Colors.pink.shade200,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Result is",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Text(
                  bmiCalc.toStringAsFixed(1),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                ),
                Text(
                  result,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.refresh),
                  color: Colors.white,
                  iconSize: 35,
                )
              ],
            ),
          ),
        ));
  }
}
