import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rwad_two/const.dart';
import 'package:rwad_two/dummy_projects/ecommerce/login/widgets/custom_text_field.dart';
import 'package:rwad_two/dummy_projects/ecommerce/register/cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final _key = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          Get.snackbar(
            "Error",
            state.msg,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
            left: 20,
            right: 20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Container(
                      width: width * .8,
                      child: Image.asset(
                        imagePath + "logo2.png",
                      ),
                    ),
                    SizedBox(
                      height: height * .2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          height: height,
                          text: "Email",
                          validator: (val) {
                            if (!val!.isEmail) {
                              return "this should be valid Email.";
                            } else if (val!.length < 10) {
                              return " email should be more than 10 letters";
                            }
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextField(
                          height: height,
                          controller: _passwordController,
                          text: "Password",
                          isPassword: true,
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password should be more than 7 letters";
                            }
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextField(
                          height: height,
                          controller: _nameController,
                          text: "Name",
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextField(
                          height: height,
                          controller: _phoneController,
                          text: "Phone",
                          validator: (val) {
                            if (val!.length == 11) {
                              return "Phone should be more than 11 Nums";
                            }
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return MaterialButton(
                                color: Colors.green,
                                minWidth: double.infinity,
                                child: _loginWidget(state),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    context.read<RegisterCubit>().register(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          name: _nameController.text,
                                          phone: _phoneController.text,
                                        );
                                  }
                                });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginWidget(RegisterState state) {
    if (state is RegisterLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      "SignUp",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}
