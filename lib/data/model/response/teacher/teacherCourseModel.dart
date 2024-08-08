class TeacherCoursesModel {
  int? teacherId;
  List<Subjects>? subjects;
  int? success;

  TeacherCoursesModel({this.teacherId, this.subjects, this.success});

  TeacherCoursesModel.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    return data;
  }
}

class Subjects {
  int? id;
  String? name;
  int? coef;
  String? code;
  String? objective;
  String? outcomes;
  int? levelId;
  int? semesterId;
  String? status;
  int? classes;
  int? campusId;

  Subjects(
      {this.id,
      this.name,
      this.coef,
      this.code,
      this.objective,
      this.outcomes,
      this.levelId,
      this.semesterId,
      this.status,
      this.classes,
      this.campusId});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coef = json['coef'];
    code = json['code'];
    objective = json['objective'];
    outcomes = json['outcomes'];
    levelId = json['level_id'];
    semesterId = json['semester_id'];
    status = json['status'];
    classes = json['classes'];
    campusId = json['campus_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coef'] = coef;
    data['code'] = code;
    data['objective'] = objective;
    data['outcomes'] = outcomes;
    data['level_id'] = levelId;
    data['semester_id'] = semesterId;
    data['status'] = status;
    data['class'] = classes;
    data['campus_id'] = campusId;
    return data;
  }
}
