import 'dart:math';
import 'package:bmi_calculator/enum_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  Gender selectedGender = Gender.female;
  double slidervalue = 180.0;
  double weight = 50;
  int age = 50;

  void calculate(double height, double weight, BuildContext context) {
    double res = weight / pow(height / 100, 2);
    String msg = "";
    Icon iconData = const Icon(Icons.sentiment_neutral);

    if (res <= 18.5) {
      msg = "Underweight";
      iconData = const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.amber,
        size: 50,
      );
    } else if (res > 18.5 && res <= 25) {
      msg = "Normal";
      iconData = const Icon(
        Icons.sentiment_very_satisfied,
        color: Colors.amber,
        size: 50,
      );
    } else if (res > 25 && res <= 30) {
      msg = "Overweight";
      iconData = const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.amber,
        size: 50,
      );
    } else {
      msg = "Obese";
      iconData = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.amber,
        size: 50,
      );
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: iconData,
            content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You BMI ${res.toStringAsFixed(1)}"),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("You are $msg"),
                ]),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("BMI CALCULATOR"),
              centerTitle: true,
            ),
            body: Column(children: [
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedGender == Gender.male
                                  ? Colors.lightBlue
                                  : Colors.blueGrey),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.male,
                                    size: 100, color: Colors.white),
                                SizedBox(height: 5),
                                Text("MALE",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ])),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedGender == Gender.female
                                  ? Colors.lightBlue
                                  : Colors.blueGrey),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.female,
                                    size: 100, color: Colors.white),
                                SizedBox(height: 5),
                                Text("FEMALE",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ])),
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("HEIGHT",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(slidervalue.toStringAsFixed(1),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              const SizedBox(width: 5),
                              const Text("cm",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ],
                          ),
                          Slider(
                              value: slidervalue,
                              min: 120.0,
                              max: 225.0,
                              onChanged: (value) {
                                setState(() {
                                  slidervalue = value;
                                });
                              })
                        ])),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("WEIGHT",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(weight.toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                const SizedBox(width: 10),
                                const Text("kg",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(Icons.add,
                                        size: 20, color: Colors.blueGrey),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(Icons.remove,
                                        size: 20, color: Colors.blueGrey),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("AGE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(age.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                const SizedBox(width: 10),
                                const Text("years",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(Icons.add,
                                        size: 20, color: Colors.blueGrey),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(Icons.remove,
                                        size: 20, color: Colors.blueGrey),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    calculate(slidervalue, weight, context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => ResultBMI(
                    //             height: slidervalue,
                    //             weight: weight,
                    //             age: age)));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      height: 50,
                      width: double.infinity,
                      child: Text("Calculate ".toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white))),
                ),
              )
            ])));
  }
}
