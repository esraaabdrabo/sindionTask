import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sindion/model/auth/user.dart';
import 'package:sindion/services/auth/auth.dart';

import '../assets/cache_helper.dart';
import '../assets/constants.dart';

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

  void setUserType(String newUserType) {
    log(newUserType);
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
    required String userName,
    required String password,
  }) {
    user.username = userName;
    user.password = password;
    registerUser();
  }

  void setCountry({required String country}) {
    user.country = country;
  }

  void registerUser() async {
    changeIsLoading(true);
    await AuthSV().register(newUser: user);
    changeIsLoading(false);
  }

//check current user
  Future<int> checkCurrentUser(BuildContext context) async {
    //user was singed in
    var userIdSharedPref = await CacheHelper.getData(key: Constants.userIdKey);
    if (userIdSharedPref != null) {
      //   userId = userIdSharedPref;
      //   currentUser = await CheckPregSV().getUser(userId!);

      ///check if the user device still the same (token has been changed or not)
      return 1;
    }
    //no user found
    return 0;
  }

/*
  Future<void> signUp(
    BuildContext context,
    TextEditingController age,
    TextEditingController weight,
    TextEditingController week,
    TextEditingController month,
  ) async {
    changeIsLoading(true);
    var response = await AuthSV().signUp(
        email: email,
        password: pass,
        newUser: await makeUser(age, weight, week, month));
    if (response is UserCredential) {
      CacheHelper.setData(data: response.user!.uid, key: Constants.userIdKey);
      CacheHelper.setData(data: await getDeviceToken(), key: Constants.token);
      currentUser = await CheckPregSV().getUser(response.user!.uid);

      resetUserInfo();
      goToReplcement(context: context, screen: const Home());
      changeIsLoading(false);
    } else {
      //TODO BUG not showing dialog
      changeIsLoading(false);
      signpExceptionAlert(response, context);
    }
    //currentStep = 1;
  }
*/
  /* signpExceptionAlert(response, BuildContext context) {
    return CustomAlertYesAction(
      title: handleException(response),
    );
  }*/

  handleException(String mess) {
    switch (mess) {
      case "The email address is badly formatted.":
        return "البريد الالكتروني غير صحيح";
      case "The email address is already in use by another account.":
        return "البريد الالكتروني مسجل بالفعل";
      case "The password is invalid or the user does not have a password.":
        return "كلمة المرور خاطئة";
      case "There is no user record corresponding to this identifier. The user may have been deleted.":
        return "هذا الحساب غير مسجل ";
      default:
        return "حدث خطأ ما برجاء المحاولة مرة أخرى";
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
