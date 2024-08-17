import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int count = 0;

  void increment() {
    count++;
    emit(CounterTextChangedState());
    // setState(() {});
  }
}
