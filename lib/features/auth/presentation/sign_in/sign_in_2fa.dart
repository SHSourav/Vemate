import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketemaa/app_routes/app_routes.dart';
import 'package:ketemaa/core/Provider/postData.dart';
import 'package:ketemaa/core/language/language_string.dart';
import 'package:ketemaa/core/utilities/app_colors/app_colors.dart';
import 'package:ketemaa/core/utilities/app_spaces/app_spaces.dart';
import 'package:ketemaa/core/utilities/common_widgets/password_input_field.dart';
import 'package:ketemaa/core/utilities/common_widgets/text_input_field.dart';
import 'package:provider/provider.dart';

class SignIn2FA extends StatefulWidget {
  const SignIn2FA({Key? key}) : super(key: key);

  @override
  _SignIn2FAState createState() => _SignIn2FAState();
}

class _SignIn2FAState extends State<SignIn2FA> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();

  PostData? postData;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppSpaces.spaces_height_15,
              SizedBox(
                height: Get.height * .18,
                width: Get.width * .9,
                child: Image.asset(
                  'assets/media/image/vemate.png',
                  fit: BoxFit.cover,
                ),
              ),
              //AppSpaces.spaces_height_15,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: Get.width * .9,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        "Two Factor Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      )),
                  AppSpaces.spaces_height_25,
                  TextInputField(
                    labelText: "Email",
                    height: .09,
                    textType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: Get.height * .022,
                  ),
                  TextInputField(
                    labelText: "Code",
                    height: .09,
                    textType: TextInputType.emailAddress,
                    controller: codeController,
                  ),
                  SizedBox(
                    height: Get.height * .022,
                  ),
                  PasswordInputField(
                      labelText: "Password",
                      height: Get.height * .04,
                      textType: TextInputType.text,
                      controller: passController),
                  SizedBox(
                    height: Get.height * .07,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: AppColors.purpleGradient, // set border width
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20.0)), // set rounded corner radius
                    ),
                    child: TextButton(
                      onPressed: () {
                        var body = {
                          "username": emailController.text,
                          "code": codeController.text,
                          "password": passController.text
                        };

                        postData!.logInWith2FA(context, body);
                      },
                      child: Text(
                        AppLanguageString.lOG_IN.tr.toUpperCase(),
                        style:
                        Get.textTheme.button!.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
