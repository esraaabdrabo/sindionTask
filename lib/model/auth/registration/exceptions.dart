class RegistrationExceptions {
  List<String>? usernameDuplication;
  List<String>? phone1;
  List<String>? emailDuplication;

  RegistrationExceptions(
      {this.usernameDuplication, this.phone1, this.emailDuplication});

  RegistrationExceptions.fromJson(Map<String, dynamic> json) {
    usernameDuplication = json['username_duplication'] ??
        json['username_duplication'].cast<String>();
    phone1 = json['phone_1'] ?? json['phone_1'].cast<String>();
    emailDuplication =
        json['email_duplication'] ?? json['email_duplication'].cast<String>();
  }
}
