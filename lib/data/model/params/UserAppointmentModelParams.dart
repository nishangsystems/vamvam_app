class UserAppointmentModelParams {
  String? code;
  String? message;
  List<UserAppointmentModelData>? data;

  UserAppointmentModelParams({this.code, this.message, this.data});

  UserAppointmentModelParams.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserAppointmentModelData>[];
      json['data'].forEach((v) {
        data!.add(new UserAppointmentModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAppointmentModelData {
  String? id;
  String? userId;
  String? customerName;
  String? reason;
  String? description;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  String? statusString;

  UserAppointmentModelData(
      {this.id,
      this.userId,
      this.customerName,
      this.reason,
      this.description,
      this.appointmentDate,
      this.appointmentTime,
      this.status,
      this.statusString});

  UserAppointmentModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    customerName = json['customer_name'];
    reason = json['reason'];
    description = json['description'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    status = json['status'];
    statusString = json['status_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['customer_name'] = this.customerName;
    data['reason'] = this.reason;
    data['description'] = this.description;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    data['status'] = this.status;
    data['status_string'] = this.statusString;
    return data;
  }
}
