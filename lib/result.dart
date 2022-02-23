import 'dart:math';

import 'package:flutter/material.dart';

class ResultBMI extends StatefulWidget {
  double height, weight;
  int age;
  ResultBMI(
      {Key? key, required this.height, required this.weight, required this.age})
      : super(key: key);

  @override
  State<ResultBMI> createState() => _ResultBMIState();
}

double calculate(double height, double weight) {
  double res = weight / pow(height / 100, 2);

  return res;
}

class _ResultBMIState extends State<ResultBMI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Your Result")),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Center(
                  child: Text("Your BMI Result",
                      style: TextStyle(fontSize: 20, color: Colors.black))),
              Center(
                child: Text(
                    calculate(widget.height, widget.weight).toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ])));
  }
}
