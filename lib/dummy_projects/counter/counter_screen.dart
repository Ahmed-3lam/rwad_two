import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad_two/dummy_projects/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Counter App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cubit.increment,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print("Bloc Builder");
            return Text(
              cubit.count.toString(),
              style: TextStyle(fontSize: 50, color: Colors.green),
            );
          },
        ),
      ),
    );
  }
}
