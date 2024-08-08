import 'package:flutter/material.dart';

import '../../kcolors.dart';

enum Gendre {
  MALE,
  FEMALE,
}

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double selectedHeight = 120;
  double selectedWeight = 40;
  double selectedAge = 10;
  Gendre selectedGendre = Gendre.MALE;

  String? name;

  @override
  void initState() {
    name ?? "Ahmed";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C1232),
      appBar: _appBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  _gendreItem(
                    "MALE",
                    isSelected: selectedGendre == Gendre.MALE,
                    selected: Gendre.MALE,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _gendreItem("FEMALE",
                      isSelected: selectedGendre == Gendre.FEMALE,
                      selected: Gendre.FEMALE),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: _boxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedHeight.toStringAsFixed(0),
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                      Text(
                        "CM",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Slider(
                    activeColor: Colors.red,
                    min: 100,
                    max: 220,
                    value: selectedHeight,
                    onChanged: (val) {
                      selectedHeight = val;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: _boxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            selectedWeight.toStringAsFixed(0),
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                    selectedWeight++;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                  mini: true,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                    selectedWeight--;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.minimize_sharp,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: _boxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            selectedAge.toStringAsFixed(0),
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                    selectedAge++;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                  mini: true,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                    selectedAge--;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.minimize_sharp,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              final bmi = selectedWeight /
                  ((selectedHeight / 100) * (selectedHeight / 100));
              String msg;
              if (bmi < 18.5) {
                msg = "Underweight";
              } else if (bmi >= 18.5 && bmi < 24.9) {
                msg = "Normal";
              } else if (bmi >= 25 && bmi < 29.9) {
                msg = "Overweight";
              } else {
                msg = "Obesity";
              }

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(msg),
                      content: Text("Your BMI is ${bmi.toInt()}"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"))
                      ],
                    );
                  });
            },
            child: Container(
              height: 80,
              margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _gendreItem(
    String text, {
    required bool isSelected,
    required Gendre selected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectedGendre = selected;
          setState(() {});
        },
        child: Container(
          decoration: _boxDecoration(isSelected: isSelected),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration({bool isSelected = false}) {
    return BoxDecoration(
        color: isSelected ? Colors.red.withOpacity(.2) : bmiSecondaryColor,
        borderRadius: BorderRadius.circular(20));
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Color(0xFF0C1232),
      title: Text(
        "Bmi Calculator".toUpperCase(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: 8.0,
          ),
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
