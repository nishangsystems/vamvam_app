class AnnouncementModel {
  int? id;
  String? title;
  String? message;
  String? date;
  int? status;
  int? campusId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? courseId;
  String? campus;
  Course? course;
  String? audience;

  AnnouncementModel(
      {this.id,
      this.title,
      this.message,
      this.date,
      this.status,
      this.campusId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.courseId,
      this.campus,
      this.course,
      this.audience});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    date = json['date'];
    status = json['status'];
    campusId = json['campus_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    courseId = json['course_id'];
    campus = json['campus'].toString();
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    audience = json['audience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['date'] = date;
    data['status'] = status;
    data['campus_id'] = campusId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['course_id'] = courseId;
    data['campus'] = campus;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    data['audience'] = audience;
    return data;
  }
}

class Course {
  int? id;
  String? name;
  int? coef;
  String? code;
  String? objective;
  String? outcomes;
  String? createdAt;
  String? updatedAt;
  int? levelId;
  int? semesterId;
  String? status;

  Course(
      {this.id,
      this.name,
      this.coef,
      this.code,
      this.objective,
      this.outcomes,
      this.createdAt,
      this.updatedAt,
      this.levelId,
      this.semesterId,
      this.status});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coef = json['coef'];
    code = json['code'];
    objective = json['objective'];
    outcomes = json['outcomes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    levelId = json['level_id'];
    semesterId = json['semester_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coef'] = coef;
    data['code'] = code;
    data['objective'] = objective;
    data['outcomes'] = outcomes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['level_id'] = levelId;
    data['semester_id'] = semesterId;
    data['status'] = status;
    return data;
  }
}
