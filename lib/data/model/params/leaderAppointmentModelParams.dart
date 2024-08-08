class LeaderAppointmentModelParams {
  String leaderId;
  String title;
  String description;
  String appointmentDate;
  String startTime;
  String endTime;

  LeaderAppointmentModelParams(
      {required this.leaderId,
      required this.title,
      required this.description,
      required this.appointmentDate,
      required this.startTime,
      required this.endTime});

  LeaderAppointmentModelParams.fromJson(
      Map<String, dynamic> json,
      this.leaderId,
      this.title,
      this.description,
      this.appointmentDate,
      this.startTime,
      this.endTime) {
    leaderId = json['leader_id'];
    title = json['title'];
    description = json['description'];
    appointmentDate = json['appointment_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leader_id'] = leaderId;
    data['title'] = title;
    data['description'] = description;
    data['appointment_date'] = appointmentDate;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
