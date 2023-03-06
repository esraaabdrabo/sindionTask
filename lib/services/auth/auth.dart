import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sindion/model/auth/login/request.dart';
import 'package:sindion/model/auth/login/response.dart';
import 'package:sindion/model/auth/user.dart';

import '../../utils/constants.dart';

class AuthSV {
  register({required User newUser}) async {
    var response = await http.post(Uri.parse(Constants.registerAPIurl),
        body: newUser.toJson());
    if (response.statusCode == 201) {
    } else {
      try {
        Map<String, dynamic> result =
            jsonDecode(response.body) as Map<String, dynamic>;
        return result.values.first[0].toString();
      } catch (error) {
        log('$error');
        return '$error';
      }
    }
    log("response ${response.body} auth sv");
  }

  dynamic login({required LoginRequestBody body}) async {
    var response =
        await http.post(Uri.parse(Constants.loginAPIurl), body: body.toJson());
    log(response.body);
    if (response.statusCode == 200) {
      return Tokens.fromJson(jsonDecode(response.body));
    }
    return 'No active account found with the given credentials';
  }
}
