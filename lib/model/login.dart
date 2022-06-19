class Login {
  bool? status;
  String? token;
  int? userID;
  String? userEmail;

  Login({
    this.status,
    this.token,
    this.userID,
    this.userEmail,
  });

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
        status: obj['status'],
        token: obj['data']['access_token'],
        userID: obj['data']['user']['id'],
        userEmail: obj['data']['user']['email']);
  }
}
