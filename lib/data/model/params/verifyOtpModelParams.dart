class VerifyOtpModelParams {
  String executiveId;
  String userId;
  String leaderId;
  String otp;
  String deviceType;
  String deviceToken;

  VerifyOtpModelParams({
    required this.userId,
    required this.otp,
    required this.deviceType,
    required this.deviceToken,
    required this.executiveId,
    required this.leaderId,
  });

  VerifyOtpModelParams.fromJson(
      Map<String, dynamic> json,
      this.userId,
      this.otp,
      this.deviceType,
      this.deviceToken,
      this.executiveId,
      this.leaderId) {
    userId = json['user_id'];
    otp = json['otp'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    executiveId = json['executive_id'];
    leaderId = json['leader_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['otp'] = otp;
    data['device_type'] = deviceType;
    data['device_token'] = deviceToken;
    data['executive_id'] = executiveId;
    data['leader_id'] = leaderId;
    return data;
  }
}
