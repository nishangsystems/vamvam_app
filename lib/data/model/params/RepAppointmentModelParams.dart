class RepAppointmentModelParams {
  String? code;
  String? message;
  List<RepAppointmentModelData>? data;

  RepAppointmentModelParams({this.code, this.message, this.data});

  RepAppointmentModelParams.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RepAppointmentModelData>[];
      json['data'].forEach((v) {
        data!.add(new RepAppointmentModelData.fromJson(v));
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

class RepAppointmentModelData {
  String? id;
  String? executiveId;
  String? executiveName;
  String? reason;
  String? description;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  String? statusString;

  RepAppointmentModelData(
      {this.id,
      this.executiveId,
      this.executiveName,
      this.reason,
      this.description,
      this.appointmentDate,
      this.appointmentTime,
      this.status,
      this.statusString});

  RepAppointmentModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    executiveId = json['executive_id'];
    executiveName = json['executive_name'];
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
    data['executive_id'] = this.executiveId;
    data['executive_name'] = this.executiveName;
    data['reason'] = this.reason;
    data['description'] = this.description;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    data['status'] = this.status;
    data['status_string'] = this.statusString;
    return data;
  }
}
