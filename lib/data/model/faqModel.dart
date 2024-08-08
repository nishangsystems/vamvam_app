class FaqModel {
  int? id;
  String? question;
  String? answer;
  int? status;
  int? userId;
  int? campusId;
  String? createdAt;
  String? updatedAt;

  FaqModel(
      {this.id,
      this.question,
      this.answer,
      this.status,
      this.userId,
      this.campusId,
      this.createdAt,
      this.updatedAt});

  FaqModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    status = json['status'];
    userId = json['user_id'];
    campusId = json['campus_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    data['status'] = status;
    data['user_id'] = userId;
    data['campus_id'] = campusId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
