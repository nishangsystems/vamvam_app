class SemesterModel {
  int? id;
  String? name;
  int? backgroundId;
  String? createdAt;
  String? updatedAt;
  int? sem;
  int? coursesMinFee;
  double? semesterMinFee;
  int? status;
  String? resultCharges;
  int? userId;
  String? caUploadLatestDate;
  String? examUploadLatestDate;

  SemesterModel(
      {this.id,
      this.name,
      this.backgroundId,
      this.createdAt,
      this.updatedAt,
      this.sem,
      this.coursesMinFee,
      this.semesterMinFee,
      this.status,
      this.resultCharges,
      this.userId,
      this.caUploadLatestDate,
      this.examUploadLatestDate});

  SemesterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    backgroundId = json['background_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sem = json['sem'];
    coursesMinFee = json['courses_min_fee'];
    semesterMinFee = json['semester_min_fee'].toDouble();
    status = json['status'];
    resultCharges = json['result_charges'];
    userId = json['user_id'];
    caUploadLatestDate = json['ca_upload_latest_date'];
    examUploadLatestDate = json['exam_upload_latest_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['background_id'] = backgroundId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['sem'] = sem;
    data['courses_min_fee'] = coursesMinFee;
    data['semester_min_fee'] = semesterMinFee;
    data['status'] = status;
    data['result_charges'] = resultCharges;
    data['user_id'] = userId;
    data['ca_upload_latest_date'] = caUploadLatestDate;
    data['exam_upload_latest_date'] = examUploadLatestDate;
    return data;
  }
}
