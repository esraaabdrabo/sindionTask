class Tokens {
  late String refresh;
  late String access;

  Tokens({required this.refresh, required this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }
}
