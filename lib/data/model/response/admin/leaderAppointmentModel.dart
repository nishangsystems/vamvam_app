class LeaderAppointmentModel {
  String? code;
  String? message;
  List<LeaderAppointmentModelData>? data;

  LeaderAppointmentModel({this.code, this.message, this.data});

  LeaderAppointmentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaderAppointmentModelData>[];
      json['data'].forEach((v) {
        data!.add(LeaderAppointmentModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeaderAppointmentModelData {
  String? id;
  String? title;
  String? description;
  String? appointmentDate;
  String? startTime;
  String? endTime;

  LeaderAppointmentModelData(
      {this.id,
      this.title,
      this.description,
      this.appointmentDate,
      this.startTime,
      this.endTime});

  LeaderAppointmentModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    appointmentDate = json['appointment_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['appointment_date'] = appointmentDate;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
