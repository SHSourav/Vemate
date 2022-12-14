import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ketemaa/core/Provider/postData.dart';
import 'package:ketemaa/core/language/language_string.dart';
import 'package:ketemaa/core/utilities/app_colors/app_colors.dart';
import 'package:ketemaa/core/utilities/app_spaces/app_spaces.dart';
import 'package:ketemaa/core/utilities/common_widgets/password_input_field.dart';
import 'package:ketemaa/core/utilities/common_widgets/text_input_field.dart';
import 'package:ketemaa/features/BackPreviousScreen/back_previous_screen.dart';
import 'package:ketemaa/features/auth/presentation/sign_up/_controller/sign_up_controller.dart';
import 'package:ketemaa/core/utilities/common_widgets/customButtons.dart';
import 'package:ketemaa/main.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  PostData? postData;
  bool? passDigitCheck = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState

    postData = Provider.of<PostData>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackPreviousScreen(),
                  SizedBox(
                    height: Get.height * .07,
                  ),
                  SizedBox(
                    height: Get.height * .18,
                    width: Get.width * .9,
                    child: Image.asset(
                      mode == 0
                          ? 'assets/media/image/vemate1.png'
                          : 'assets/media/image/vemate.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width * .9,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor),
                          ),
                        ),
                        AppSpaces.spaces_height_25,
                        TextInputField(
                          labelText: "Username",
                          height: Get.height * .04,
                          textType: TextInputType.text,
                          controller: SignUpController.to.nameController,
                        ),
                        SizedBox(
                          height: Get.height * .022,
                        ),
                        TextInputField(
                          labelText: "Email",
                          height: Get.height * .04,
                          textType: TextInputType.emailAddress,
                          controller: SignUpController.to.emailController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PasswordInputField(
                          labelText: "Password",
                          height: Get.height * .04,
                          textType: TextInputType.text,
                          controller: SignUpController.to.passwordController,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 35),
                          height: Get.height * .022,
                          child: passDigitCheck == true
                              ? const Text(
                                  "*Min 8 characters with 1 uppercase, 1 number",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.grey, fontSize: 11),
                                )
                              : const Text(
                                  "Password must be atleast 8 characters",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.red, fontSize: 11),
                                ),
                        ),
                        PasswordInputField(
                          labelText: "Confirm Password",
                          height: Get.height * .04,
                          textType: TextInputType.text,
                          controller:
                              SignUpController.to.confirmPasswordController,
                        ),
                        SizedBox(
                          height: Get.height * .07,
                        ),
                        CustomButtons(
                          width: Get.width * .9,
                          height: Get.height * .065,
                          onTap: () {
                            var body = {
                              "nickname":
                                  SignUpController.to.nameController.text,
                              "email": SignUpController.to.emailController.text,
                              "gender": "0",
                              "birth_year": "1852",
                              "fcm_device_id": "3",
                              "password":
                                  SignUpController.to.passwordController.text
                            };
                            if (_formKey.currentState!.validate()) {
                              SignUpController.to.passwordController.text ==
                                      SignUpController
                                          .to.confirmPasswordController.text
                                  ? postData!.signUp(context, body)
                                  : Flushbar(
                                      backgroundColor:
                                          AppColors.lightBackgroundColor,
                                      flushbarPosition: FlushbarPosition.BOTTOM,
                                      isDismissible: false,
                                      duration: const Duration(seconds: 3),
                                      messageText: Text(
                                        "Password didn't match",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0.sp,
                                            color: Colors.red),
                                      ),
                                    ).show(context);
                            }
                          },
                          text: AppLanguageString.SIGN_UP.tr.toUpperCase(),
                          style: Get.textTheme.button!
                              .copyWith(color: Colors.white,fontFamily: 'Inter',),
                        )
                      ],
                    ),
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
