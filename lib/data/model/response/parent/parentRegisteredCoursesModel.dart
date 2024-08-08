class ParentRegisteredCourseModel {
  List<int>? ids;
  int? cvSum;
  List<Courses>? courses;
  Year? year;
  Year? semester;
  Year? classes;

  ParentRegisteredCourseModel(
      {this.ids,
      this.cvSum,
      this.courses,
      this.year,
      this.semester,
      this.classes});

  ParentRegisteredCourseModel.fromJson(Map<String, dynamic> json) {
    ids = json['ids'].cast<int>();
    cvSum = json['cv_sum'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
    year = json['year'] != null ? Year.fromJson(json['year']) : null;
    semester =
        json['semester'] != null ? Year.fromJson(json['semester']) : null;
    classes = json['classes'] != null ? Year.fromJson(json['classes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ids'] = ids;
    data['cv_sum'] = cvSum;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    if (year != null) {
      data['year'] = year!.toJson();
    }
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    if (classes != null) {
      data['class'] = classes!.toJson();
    }
    return data;
  }
}

class Courses {
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
  int? cv;

  Courses(
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
      this.status,
      this.cv});

  Courses.fromJson(Map<String, dynamic> json) {
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
    cv = json['cv'];
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
    data['cv'] = cv;
    return data;
  }
}

class Year {
  int? id;
  String? name;

  Year({this.id, this.name});

  Year.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
