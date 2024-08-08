class LoginModelParams {
  String? mobileEmail;
  String? password;
  String? loginType;
  String? deviceType;
  String? deviceToken;
  String? email;
  String? mobile;
  String? name;
  String? username;
  String? address;

  LoginModelParams(
      {this.mobileEmail,
      this.password,
      this.loginType,
      this.deviceType,
      this.deviceToken,
      this.email,
      this.name,
      this.mobile,
      this.username,
      this.address});

  LoginModelParams.fromJson(
      Map<String, dynamic> json,
      this.mobileEmail,
      this.password,
      this.loginType,
      this.deviceType,
      this.deviceToken,
      this.email,
      this.mobile,
      this.name,
      this.username,
      this.address) {
    mobileEmail = json['mobile_email'];
    password = json['password'];
    loginType = json['login_type'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    email = json['email'];
    name = json['name'];
    mobile = json['mobile'];
    username = json['username'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_email'] = mobileEmail;
    data['password'] = password;
    data['login_type'] = loginType;
    data['device_type'] = deviceType;
    data['device_token'] = deviceToken;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['username'] = username;
    data['address'] = address;
    return data;
  }
}
