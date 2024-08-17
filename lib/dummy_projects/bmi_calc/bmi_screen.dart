import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../kcolors.dart';
import 'cubit/bmi_cubit.dart';

class BmiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BmiCubit>();
    return Scaffold(
      backgroundColor: Color(0xFF0C1232),
      appBar: _appBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      _gendreItem(
                        "MALE",
                        cubit,
                        isSelected: cubit.selectedGendre == Gender.MALE,
                        selected: Gender.MALE,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      _gendreItem("FEMALE", cubit,
                          isSelected: cubit.selectedGendre == Gender.FEMALE,
                          selected: Gender.FEMALE),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: _boxDecoration(),
              child: BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return Column(
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
                            cubit.selectedHeight.toStringAsFixed(0),
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
                        value: cubit.selectedHeight,
                        onChanged: (val) {
                          cubit.changeHeight(val);
                        },
                      )
                    ],
                  );
                },
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
                          BlocBuilder<BmiCubit, BmiState>(
                            builder: (context, state) {
                              return Text(
                                cubit.selectedWeight.toStringAsFixed(0),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50),
                              );
                            },
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
                                    cubit.changeWeight();
                                  },
                                  child: Icon(Icons.add),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                  mini: true,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                    cubit.changeWeight(plus: false);
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
                          BlocBuilder<BmiCubit, BmiState>(
                            builder: (context, state) {
                              return Text(
                                cubit.selectedAge.toStringAsFixed(0),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50),
                              );
                            },
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
                                    cubit.changeAge();
                                    // setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                  mini: true,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                    cubit.changeAge(
                                      plus: false,
                                    );
                                    // setState(() {});
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
              final bmi = cubit.selectedWeight /
                  ((cubit.selectedHeight / 100) * (cubit.selectedHeight / 100));
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
    String text,
    BmiCubit cubit, {
    required bool isSelected,
    required Gender selected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          cubit.changeGender(selected);
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
