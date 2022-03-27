import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ketemaa/core/Provider/getData.dart';
import 'package:ketemaa/core/utilities/urls/urls.dart';
import 'package:ketemaa/features/auth/presentation/auth_initial_page/auth_initial_page.dart';
import 'package:ketemaa/features/auth/verification/otpPage.dart';
import 'package:ketemaa/features/controller_page/presentattion/controller_page.dart';
import 'package:ketemaa/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostData extends ChangeNotifier {
  GetData? getData;
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  Map<String, String> requestHeadersWithToken = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'token ${prefs!.getString('token')}',
  };
  Map<String, String> requestToken = {
    'Authorization': 'token ${prefs!.getString('token')}',
  };

  Future signUp(BuildContext context, var body) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const CircularProgressIndicator());

    printInfo(info: body.toString());

    final response = await http.post(Uri.parse(Urls.signUp),
        body: json.encode(body), headers: requestHeaders);
    var x = json.decode(response.body);

    printInfo(info: x.toString());
    Map<String, dynamic> js = x;
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403 ||
        response.statusCode == 500 ||
        response.statusCode == 201) {
      try {
        if (js.containsKey('id')) {
          prefs = await SharedPreferences.getInstance();
          prefs!.setString(
              'is_email_verified', js['is_email_verified'].toString());
          prefs!.setString('email', js['email'].toString());

          printInfo(info: prefs!.getString('is_email_verified').toString());

          Get.to(() => OtpPage());

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Registration Successful",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              )).show(context);
        } else {
          Navigator.of(context).pop();

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Invalid Information",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              )).show(context);
        }
      } catch (e) {
        Navigator.of(context).pop();
        Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            isDismissible: false,
            duration: const Duration(seconds: 3),
            messageText: const Text(
              "Something went wrong",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            )).show(context);
      }
    } else {
      Navigator.of(context).pop();
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          isDismissible: false,
          duration: const Duration(seconds: 3),
          messageText: Text(
            js.toString(),
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          )).show(context);
    }
    notifyListeners();
  }

  Future verifyCode(BuildContext context, var body) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const CircularProgressIndicator());

    printInfo(info: body.toString());

    final response = await http.post(Uri.parse(Urls.verifyCode),
        body: json.encode(body), headers: requestHeaders);

    /*var x = json.decode(response.body);

    printInfo(info: response.body.toString());*/

    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403 ||
        response.statusCode == 500 ||
        response.statusCode == 201) {
      Get.to(() => const AuthInitialPage());
      try {
        /*if (x['code'] == 'True') {

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: Text(
                x['message'],
                style: const TextStyle(fontSize: 16.0, color: Colors.green),
              ))
            .show(context);
        } else {
          Navigator.of(context).pop();

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Invalid Information",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ))
            .show(context);
        }*/
      } catch (e) {
        Navigator.of(context).pop();
        Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            isDismissible: false,
            duration: const Duration(seconds: 3),
            messageText: const Text(
              "Something went wrong",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            )).show(context);
        return response.body;
      }
    } else {
      Navigator.of(context).pop();
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          isDismissible: false,
          duration: const Duration(seconds: 3),
          messageText: const Text(
            "Something went wrong",
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          )).show(context);
    }
  }

  Future resendCode(BuildContext context, var body) async {
    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const CircularProgressIndicator());*/

    printInfo(info: body.toString());

    final response = await http.post(Uri.parse(Urls.resendCode),
        body: json.encode(body), headers: requestHeaders);

    /*var x = json.decode(response.body);

    printInfo(info: response.body.toString());*/

    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403 ||
        response.statusCode == 500 ||
        response.statusCode == 201) {
      printInfo(info: 'From if');

      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          isDismissible: false,
          duration: const Duration(seconds: 3),
          messageText: const Text(
            "Code send successfully",
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          )).show(context);
      try {
        /*if (x['code'] == 'True') {

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: Text(
                x['message'],
                style: const TextStyle(fontSize: 16.0, color: Colors.green),
              ))
            .show(context);
        } else {
          Navigator.of(context).pop();

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Invalid Information",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ))
            .show(context);
        }*/
      } catch (e) {
        printInfo(info: 'From catch');
        Navigator.of(context).pop();
        Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            isDismissible: false,
            duration: const Duration(seconds: 3),
            messageText: const Text(
              "Something went wrong",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            )).show(context);
        return response.body;
      }
    } else {
      printInfo(info: 'From else');
      Navigator.of(context).pop();
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          isDismissible: false,
          duration: const Duration(seconds: 3),
          messageText: const Text(
            "Something went wrong",
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          )).show(context);
    }
  }

  Future logIn(BuildContext context, var body) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const CircularProgressIndicator());

    printInfo(info: body.toString());

    final response = await http.post(Uri.parse(Urls.logIn),
        body: json.encode(body), headers: requestHeaders);
    print(response.body.toString());
    var x = json.decode(response.body);

    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403 ||
        response.statusCode == 500 ||
        response.statusCode == 201) {
      try {
        Map<String, dynamic> js = x;
        if (js['is_email_verified'] == true) {
          prefs = await SharedPreferences.getInstance();

          Store(js, context);

          printInfo(info: prefs!.getString('is_email_verified').toString());

          Get.to(() => ControllerPage());

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Login Successful",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              )).show(context);
        } else {
          Navigator.of(context).pop();

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Invalid Information",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              )).show(context);
        }
      } catch (e) {
        Navigator.of(context).pop();
        Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            isDismissible: false,
            duration: const Duration(seconds: 3),
            messageText: const Text(
              "Something went wrong",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            )).show(context);
      }
    } else {
      Navigator.of(context).pop();
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          isDismissible: false,
          duration: const Duration(seconds: 3),
          messageText: const Text(
            "Something went wrong",
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          )).show(context);
    }
    notifyListeners();
  }

  Future updateProfile(BuildContext context, var body) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const CircularProgressIndicator());

    printInfo(info: body.toString());

    final response = await http.patch(Uri.parse(Urls.updateUserInfo),
        body: json.encode(body), headers: requestHeadersWithToken);
    print(response.body.toString());
    var x = json.decode(response.body);

    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403 ||
        response.statusCode == 500 ||
        response.statusCode == 201) {
      try {
        Map<String, dynamic> js = x;
        if (js['is_email_verified'] == true) {
          getData = Provider.of<GetData>(context, listen: false);
          await getData!.getUserInfo();
          prefs = await SharedPreferences.getInstance();

          prefs!.setString('name', js['name'].toString());
          prefs!.setString('email', js['email'].toString());

          printInfo(info: prefs!.getString('is_email_verified').toString());

          Navigator.of(context).pop();

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Update Successful",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              )).show(context);
        } else {
          Navigator.of(context).pop();

          Flushbar(
              flushbarPosition: FlushbarPosition.BOTTOM,
              isDismissible: false,
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "Invalid Information",
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              )).show(context);
        }
      } catch (e) {
        Navigator.of(context).pop();
        Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            isDismissible: false,
            duration: const Duration(seconds: 3),
            messageText: const Text(
              "Something went wrong",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            )).show(context);
      }
    } else {
      Navigator.of(context).pop();
      Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          isDismissible: false,
          duration: const Duration(seconds: 3),
          messageText: const Text(
            "Something went wrong",
            style: TextStyle(fontSize: 16.0, color: Colors.green),
          )).show(context);
    }
    notifyListeners();
  }

  Store(var mat, BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('user_id', mat['user_id'].toString());
    prefs!.setString('id', mat['id'].toString());
    prefs!.setString('name', mat['name'].toString());
    prefs!.setString('email', mat['email'].toString());
    prefs!.setString('phone', mat['phone'].toString());
    prefs!.setString('user_name', mat['user_name'].toString());
    prefs!.setString('user_type', mat['user_type'].toString());
    prefs!.setString('image', mat['image'].toString());
    prefs!.setString('is_email_verified', mat['is_email_verified'].toString());
    prefs!.setString('token', mat['token'].toString());
    prefs!.setBool("is_login", true);

    print(prefs!.get('token'));
  }
}