import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sindion/assets/functions.dart';
import 'package:sindion/model/auth/login/request.dart';
import 'package:sindion/model/auth/login/response.dart';
import 'package:sindion/model/auth/user.dart';
import 'package:sindion/services/auth/auth.dart';
import '../views/home/home.dart';

class AuthVM extends ChangeNotifier {
  bool isLoading = false;
  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  User user = User(
      name: '',
      username: '',
      email: '',
      phone1: '',
      password: '',
      identificationNumber: '',
      userType: '',
      country: '');
  Tokens? userTokens;

  void setUserType(String newUserType) {
    user.userType = newUserType;
    notifyListeners();
  }

  void setFirstUserData(
      {required String name,
      required String nationalID,
      required String email,
      required String phone}) {
    user.name = name;
    user.email = email;
    user.phone1 = phone;
    user.identificationNumber = nationalID;
  }

  void setSecondUserData({
    required BuildContext context,
    required String userName,
    required String password,
  }) {
    user.username = userName;
    user.password = password;
    registerUser(context: context);
  }

  void setCountry({required String country}) {
    user.country = country;
  }

  void registerUser({required BuildContext context}) async {
    changeIsLoading(true);
    var response = await AuthSV().register(newUser: user);
    if (response is String) {
      showSnackBar(context: context, text: response);
    } else {
      changeIsLoading(false);

      showSnackBar(context: context, text: 'Registration Success');
      Future.delayed(const Duration(seconds: 1)).then(
          (value) => gotoReplacement(context: context, screen: const Home()));
    }
    changeIsLoading(false);
  }

  void login(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    changeIsLoading(true);
    var response = await AuthSV()
        .login(body: LoginRequestBody(username: userName, password: password));
    if (response is Tokens) {
      userTokens = response;
      changeIsLoading(false);
      showSnackBar(context: context, text: 'Login success');
      Future.delayed(const Duration(seconds: 1)).then(
          (value) => gotoReplacement(context: context, screen: const Home()));
    } else {
      changeIsLoading(false);
      showSnackBar(context: context, text: response.toString());
    }
  }

//########################################################
/*  Future<void> signIn(BuildContext context) async {
    changeIsLoading(true);
    var response = await AuthSV().signIn(email: email, password: pass);
    if (response is UserCredential) {
      currentUser = await CheckPregSV().getUser(response.user!.uid);
      log("vm get user after login");
      userId = response.user!.uid;
      await checkCurrentToken();
      goToReplcement(context: context, screen: const Home());
    } else {
      showDialog(
        context: context,
        builder: (context) => CustomAlertYesAction(
          title: handleException(response),
        ),
      );
    }
    changeIsLoading(false);
  }
  //################reset password ##############
*/
/*  Future<bool> resetPass(BuildContext context) async {
    changeIsLoading(true);
    bool isSend = await AuthSV().resetPass(email: email);
    changeIsLoading(false);
    return isSend;
  }*/
}
