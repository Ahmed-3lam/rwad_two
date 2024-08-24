import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rwad_two/dummy_projects/ecommerce/helpers/dio_helpers.dart';
import 'package:rwad_two/dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'package:rwad_two/dummy_projects/ecommerce/helpers/kapi.dart';
import 'package:rwad_two/dummy_projects/ecommerce/login/model/login_model.dart';
import 'package:rwad_two/dummy_projects/ecommerce/main/main_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();

  //--------- LOGIN -------------
  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      final response = await DioHelpers.postData(
        path: KApi.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status ?? false) {
        HiveHelper.setToken(loginModel.data?.token ?? "");
        Get.offAll(MainScreen());
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(loginModel.message ?? "Error"));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
