import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  double selectedHeight = 120;
  double selectedWeight = 40;
  double selectedAge = 10;
  Gender selectedGendre = Gender.MALE;

  String? name;

  void changeGender(Gender gender) {
    selectedGendre = gender;
    emit(BmiGenderState());
  }

  void changeHeight(double height) {
    selectedHeight = height;
    emit(BmiChangeHeightState());
  }

  void changeWeight({bool plus = true}) {
    plus ? selectedWeight++ : selectedWeight--;
    emit(BmiChangeHeightState());
  }

  void changeAge({bool plus = true}) {
    plus ? selectedAge++ : selectedAge--;
    emit(BmiChangeHeightState());
  }
}

enum Gender {
  MALE,
  FEMALE,
}
