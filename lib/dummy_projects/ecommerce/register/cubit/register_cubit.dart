import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../helpers/dio_helpers.dart';
import '../../helpers/hive_helper.dart';
import '../../helpers/kapi.dart';
import '../../login/model/login_model.dart';
import '../../main/main_screen.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  LoginModel registerModel = LoginModel();

  //--------- Register -------------
  void register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      emit(RegisterLoadingState());
      final response = await DioHelpers.postData(
        path: KApi.register,
        body: {
          "email": email,
          "password": password,
          "name": name,
          "phone": phone,
        },
      );
      registerModel = LoginModel.fromJson(response.data);
      if (registerModel.status ?? false) {
        HiveHelper.setToken(registerModel.data?.token ?? "");
        Get.offAll(MainScreen());
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState(registerModel.message ?? "Error"));
      }
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }
}
