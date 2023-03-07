import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sindion/helper/cache_helper.dart';
import 'package:sindion/model/auth/login/request.dart';
import 'package:sindion/model/auth/login/response.dart';
import 'package:sindion/model/auth/registration/user.dart';
import 'package:sindion/services/auth/auth.dart';
import 'package:sindion/utils/constants.dart';
import 'package:sindion/views/auth/login/login.dart';
import '../utils/functions.dart';
import '../views/home/home.dart';

class AuthVM extends ChangeNotifier {
  bool isLoading = false;
  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  TextEditingController nameCont = TextEditingController();
  TextEditingController nationalIDcont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  TextEditingController countryCont = TextEditingController();
  final formKey2 = GlobalKey<FormState>();
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

  void setUserData({
    required BuildContext context,
  }) {
    user.name = nameCont.text;
    user.email = emailCont.text;
    user.phone1 = phoneCont.text;
    user.identificationNumber = nationalIDcont.text;
    user.username = userNameCont.text;
    user.password = passwordcont.text;
    registerUser(context: context);
  }

  void setCountry({required String country}) {
    user.country = country;
  }

  Future<bool> checkIfUserSignedIn() async {
    var response = await CacheHelper.getData(key: Constants.tokensKey);
    if (response != null) {
      userTokens = Tokens.fromJson(jsonDecode(response));
      log(userTokens!.refresh);
      return true;
    }
    return false;
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
          (value) => gotoReplacement(context: context, screen: const Login()));
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
      saveTokens(response: response);
      showSnackBar(context: context, text: 'Login success');
      Future.delayed(const Duration(seconds: 1)).then(
          (value) => gotoReplacement(context: context, screen: const Home()));
    } else {
      changeIsLoading(false);
      showSnackBar(context: context, text: response.toString());
    }
  }

  void saveTokens({required Tokens response}) {
    userTokens = response;
    CacheHelper.setData(
        data: jsonEncode(response.toJson()), key: Constants.tokensKey);
    changeIsLoading(false);
  }

  void logout({required BuildContext context}) async {
    showAlertDialog(
        context: context,
        yesFunction: () async {
          await AuthSV().logout(refreshToken: userTokens!.refresh);
          if (await CacheHelper.removeData(key: Constants.tokensKey)) {
            gotoReplacement(context: context, screen: const Login());
          }
        },
        title: 'You Want To Logout?');
  }
}
