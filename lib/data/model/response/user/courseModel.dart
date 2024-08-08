class CourseModel {
  int? cvSum;
  List<CoursesData>? courses;

  CourseModel({this.cvSum, this.courses});

  CourseModel.fromJson(Map<String, dynamic> json) {
    cvSum = json['cv_sum'];
    if (json['courses'] != null) {
      courses = <CoursesData>[];
      json['courses'].forEach((v) {
        courses!.add(CoursesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cv_sum'] = cvSum;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoursesData {
  int? id;
  String? name;
  int? coef;
  int? cv;
  String? code;
  String? date;
  String? semester;
  String? level;

  CoursesData(
      {this.id,
      this.name,
      this.coef,
      this.cv,
      this.code,
      this.date,
      this.semester,
      this.level});

  CoursesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coef = json['coef'];
    cv = json['cv'];
    code = json['code'];
    date = json['date'];
    semester = json['semester'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coef'] = coef;
    data['cv'] = cv;
    data['code'] = code;
    data['date'] = date;
    data['semester'] = semester;
    data['level'] = level;
    return data;
  }
}
