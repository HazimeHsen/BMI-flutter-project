import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_10/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 60;
  double weight = 30;
  double age = 18;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text("BMI"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: isMale
                            ? Border.all(color: Colors.black, width: 3)
                            : null,
                      ),
                      height: 180,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 80,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: !isMale
                            ? Border.all(color: Colors.black, width: 3)
                            : null,
                      ),
                      height: 180,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 80,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$height",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Slider(
                          value: height,
                          min: 30,
                          max: 300,
                          thumbColor: Colors.blueGrey.shade100,
                          activeColor: Colors.blue.shade300,
                          onChanged: (double value) {
                            setState(() {
                              height = value.ceilToDouble();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blue,
                              ),
                              child: GestureDetector(
                                onTapDown: (details) {
                                  startTimer((timer) {
                                    setState(() {
                                      age++;
                                    });
                                  });
                                },
                                onTapUp: (details) {
                                  stopTimer();
                                },
                                onTapCancel: () {
                                  stopTimer();
                                },
                                onTap: () {
                                  setState(() {
                                    if (age > 0) age++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red.shade400,
                              ),
                              child: GestureDetector(
                                onTapDown: (details) {
                                  startTimer((timer) {
                                    setState(() {
                                      if (age > 0) age--;
                                    });
                                  });
                                },
                                onTapUp: (details) {
                                  stopTimer();
                                },
                                onTapCancel: () {
                                  stopTimer();
                                },
                                onTap: () {
                                  setState(() {
                                    if (age > 0) age--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$weight",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blue,
                              ),
                              child: GestureDetector(
                                onTapDown: (details) {
                                  startTimer((timer) {
                                    setState(() {
                                      weight++;
                                    });
                                  });
                                },
                                onTapUp: (details) {
                                  stopTimer();
                                },
                                onTapCancel: () {
                                  stopTimer();
                                },
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red.shade400,
                              ),
                              child: GestureDetector(
                                onTapDown: (details) {
                                  startTimer((timer) {
                                    setState(() {
                                      if (weight > 0) weight--;
                                    });
                                  });
                                },
                                onTapUp: (details) {
                                  stopTimer();
                                },
                                onTapCancel: () {
                                  stopTimer();
                                },
                                onTap: () {
                                  setState(() {
                                    if (weight > 0) weight--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      height: height,
                      weight: weight,
                      age: age,
                      isMale: isMale,
                    ),
                  ),
                );
              },
              child: const Text("Calculate"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width / 2, 0),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                textStyle:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late Timer _timer;
  int _count = 0;

  void startTimer(Function(Timer) callback) {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      callback(timer);
      _count++;
      if (_count > 10) {
        _timer.cancel();
        _count = 0;
      }
    });
  }

  void stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
      _count = 0;
    }
  }
}
