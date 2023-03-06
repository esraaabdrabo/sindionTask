import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sindion/assets/constants.dart';
import 'package:sindion/model/auth/user.dart';

class AuthSV {
  register({required User newUser}) async {
    var response = await http.post(Uri.parse(Constants.registerAPIurl),
        body: newUser.toJson());
    log("response ${response.body} auth sv");
  }
}
