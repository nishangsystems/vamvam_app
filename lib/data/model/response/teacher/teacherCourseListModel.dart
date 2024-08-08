class TeacherCourseListModel {
  Course? course;
  Students? students;
  int? success;

  TeacherCourseListModel({this.course, this.students, this.success});

  TeacherCourseListModel.fromJson(Map<String, dynamic> json) {
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    students =
        json['students'] != null ? Students.fromJson(json['students']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (students != null) {
      data['students'] = students!.toJson();
    }
    data['success'] = success;
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

class Students {
  List<BONABERI>? bONABERI;

  Students({this.bONABERI});

  Students.fromJson(Map<String, dynamic> json) {
    if (json['BONABERI'] != null) {
      bONABERI = <BONABERI>[];
      json['BONABERI'].forEach((v) {
        bONABERI!.add(BONABERI.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bONABERI != null) {
      data['BONABERI'] = bONABERI!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BONABERI {
  int? id;
  String? name;
  String? email;
  String? matric;
  String? password;
  String? phone;
  String? dob;
  int? admissionBatchId;
  String? gender;
  String? pob;
  String? address;
  String? region;
  String? division;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? parentName;
  String? parentPhoneNumber;
  int? campusId;
  int? programId;
  int? imported;
  int? active;
  String? campusName;

  BONABERI(
      {this.id,
      this.name,
      this.email,
      this.matric,
      this.password,
      this.phone,
      this.dob,
      this.admissionBatchId,
      this.gender,
      this.pob,
      this.address,
      this.region,
      this.division,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.parentName,
      this.parentPhoneNumber,
      this.campusId,
      this.programId,
      this.imported,
      this.active,
      this.campusName});

  BONABERI.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    matric = json['matric'];
    password = json['password'];
    phone = json['phone'];
    dob = json['dob'];
    admissionBatchId = json['admission_batch_id'];
    gender = json['gender'];
    pob = json['pob'];
    address = json['address'];
    region = json['region'];
    division = json['division'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    parentName = json['parent_name'];
    parentPhoneNumber = json['parent_phone_number'];
    campusId = json['campus_id'];
    programId = json['program_id'];
    imported = json['imported'];
    active = json['active'];
    campusName = json['campus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['matric'] = matric;
    data['password'] = password;
    data['phone'] = phone;
    data['dob'] = dob;
    data['admission_batch_id'] = admissionBatchId;
    data['gender'] = gender;
    data['pob'] = pob;
    data['address'] = address;
    data['region'] = region;
    data['division'] = division;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['parent_name'] = parentName;
    data['parent_phone_number'] = parentPhoneNumber;
    data['campus_id'] = campusId;
    data['program_id'] = programId;
    data['imported'] = imported;
    data['active'] = active;
    data['campus_name'] = campusName;
    return data;
  }
}
