import 'dart:developer';

class RegistrationExceptions {
  List<String>? usernameDuplication;
  List<String>? phone1;
  List<String>? emailDuplication;

  // List<String>? identificationImage;
  // List<String>? sign;
  // List<String>? personalImage;

  RegistrationExceptions(
      {this.usernameDuplication,
      this.phone1,
      //  this.identificationImage,
      //  this.sign,
      //  this.personalImage,
      this.emailDuplication});

  RegistrationExceptions.fromJson(Map<String, dynamic> json) {
    log("message");

    usernameDuplication = json['username_duplication'] ??
        json['username_duplication'].cast<String>();
    phone1 = json['phone_1'] ?? json['phone_1'].cast<String>();
    // identificationImage = json['identification_image'].cast<String>();
    // sign = json['sign'].cast<String>();
    // personalImage = json['personal_image'].cast<String>();
    emailDuplication =
        json['email_duplication'] ?? json['email_duplication'].cast<String>();
  }
}
