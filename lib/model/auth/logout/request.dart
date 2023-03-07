class LogoutRequestBody {
  late String refreshToken;

  LogoutRequestBody({required this.refreshToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refreshToken;
    return data;
  }
}
