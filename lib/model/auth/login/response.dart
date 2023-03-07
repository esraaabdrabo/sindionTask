class Tokens {
  late String refresh;
  late String access;

  Tokens({required this.refresh, required this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
