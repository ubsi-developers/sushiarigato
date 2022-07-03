class Register {
  bool? status;
  String? token;
  int? userID;
  String? userEmail;

  Register({
    this.status,
    this.token,
    this.userID,
    this.userEmail,
  });

  factory Register.fromJson(Map<String, dynamic> obj) {
    return Register(
        status: obj['status'],
        token: obj['data']['access_token'],
        userID: obj['data']['user']['id'],
        userEmail: obj['data']['user']['email']);
  }
}
