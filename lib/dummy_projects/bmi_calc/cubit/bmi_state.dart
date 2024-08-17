part of 'bmi_cubit.dart';

@immutable
sealed class BmiState {}

final class BmiInitial extends BmiState {}

final class BmiGenderState extends BmiState {}

final class BmiChangeHeightState extends BmiState {}

final class BmiChangeWeightState extends BmiState {}

final class BmiChangeAgeState extends BmiState {}

final class BmiCalculatePressedState extends BmiState {}
