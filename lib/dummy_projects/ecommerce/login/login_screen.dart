import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:rwad_two/const.dart';
import 'package:rwad_two/dummy_projects/ecommerce/login/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final _key = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    return Scaffold(
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
                          if (val!.length < 8) {
                            return "Password should be more than 7 letters";
                          }
                        },
                      ),
                      CustomTextField(
                        height: height,
                        controller: _confirmPasswordController,
                        text: "Confirm Password",
                        isPassword: true,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      MaterialButton(
                          color: Colors.green,
                          minWidth: double.infinity,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              print("Login ========");
                            }
                            print(" Email is ${_emailController.text}");
                            print(" Password is ${_passwordController.text}");
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
