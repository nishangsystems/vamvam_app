class TeacherStudentProfleModel {
  Student? student;
  Unit? unit;
  int? success;

  TeacherStudentProfleModel({this.student, this.unit, this.success});

  TeacherStudentProfleModel.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class Student {
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

  Student(
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
      this.active});

  Student.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Unit {
  int? id;
  int? programId;
  int? levelId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Unit(
      {this.id,
      this.programId,
      this.levelId,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programId = json['program_id'];
    levelId = json['level_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['program_id'] = programId;
    data['level_id'] = levelId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? studentId;
  String? classId;

  Pivot({this.studentId, this.classId});

  Pivot.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    classId = json['class_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['class_id'] = classId;
    return data;
  }
}
