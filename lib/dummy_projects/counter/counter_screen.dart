import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void increment() {
    count++;
    setState(() {});
    print("============= count is : $count");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(fontSize: 50, color: Colors.green),
        ),
      ),
    );
  }
}
