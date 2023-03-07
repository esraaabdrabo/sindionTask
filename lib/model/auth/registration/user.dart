import 'dart:developer';

class User {
  String id = '';
  late String name;
  late String username;
  late String email;
  late String phone1;
  late String password;
  late String identificationNumber;
  late String userType;
  late String country;

  User(
      {required this.name,
      required this.username,
      required this.email,
      required this.phone1,
      required this.password,
      required this.identificationNumber,
      required this.userType,
      required this.country});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone1 = json['phone_1'];
    identificationNumber = json['identification_number'];
    userType = json['user_type'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    log("will convert user to json (user model)");
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone_1'] = phone1;
    data['password'] = password;
    data['password_2'] = password;
    data['identification_number'] = identificationNumber;
    //only available user type is 0 or 1
    data['user_type'] = int.parse(userType) > 1 ? '0' : userType;
    userType;
    data['country'] = country;
    log("end converting user to json (user model)");

    return data;
  }
}
