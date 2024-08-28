class CAResultModel {
  Data? data;

  CAResultModel({this.data});

  factory CAResultModel.fromJson(Map<String, dynamic> json) {
    return CAResultModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? title;
  User? user;
  Year? year;
  Classes? classes;
  int? caTotal;
  Semester? semester;
  List<Grading>? grading;
  List<Results>? results;

  Data({
    this.title,
    this.user,
    this.year,
    this.classes,
    this.caTotal,
    this.semester,
    this.grading,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json['title'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      year: json['year'] != null ? Year.fromJson(json['year']) : null,
      classes: json['class'] != null ? Classes.fromJson(json['class']) : null,
      caTotal: json['ca_total'],
      semester: json['semester'] != null ? Semester.fromJson(json['semester']) : null,
      grading: json['grading'] != null ? (json['grading'] as List).map((i) => Grading.fromJson(i)).toList() : null,
      results: json['results'] != null ? (json['results'] as List).map((i) => Results.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (year != null) {
      data['year'] = year!.toJson();
    }
    if (classes != null) {
      data['class'] = classes!.toJson();
    }
    data['ca_total'] = caTotal;
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    if (grading != null) {
      data['grading'] = grading!.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

class Semester {
  int? id;
  String? name;
  int? backgroundId;
  String? createdAt;
  String? updatedAt;
  int? sem;
  int? coursesMinFee;
  int? semesterMinFee;
  int? status;
  String? resultCharges;
  int? userId;
  String? caUploadLatestDate;
  String? examUploadLatestDate;

  Semester(
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

  Semester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    backgroundId = json['background_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sem = json['sem'];
    // coursesMinFee = json['courses_min_fee'];
    // semesterMinFee = json['semester_min_fee'];
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

class Classes {
  int? id;
  int? programId;
  int? levelId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Classes(
      {this.id,
        this.programId,
        this.levelId,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Classes.fromJson(Map<String, dynamic> json) {
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

class Year {
  int? id;
  String? name;
  String? payChannel;
  int? payCharges;
  String? createdAt;
  String? updatedAt;

  Year(
      {this.id,
        this.name,
        this.payChannel,
        this.payCharges,
        this.createdAt,
        this.updatedAt});

  Year.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payChannel = json['pay_channel'];
    payCharges = json['pay_charges'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['pay_channel'] = payChannel;
    data['pay_charges'] = payCharges;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Grading {
  int? id;
  String? lower;
  String? upper;
  String? weight;
  String? grade;
  int? status;
  String? remark;
  int? gradingTypeId;
  String? createdAt;
  String? updatedAt;

  Grading(
      {this.id,
        this.lower,
        this.upper,
        this.weight,
        this.grade,
        this.status,
        this.remark,
        this.gradingTypeId,
        this.createdAt,
        this.updatedAt});

  Grading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lower = json['lower'];
    upper = json['upper'];
    weight = json['weight'];
    grade = json['grade'];
    status = json['status'];
    remark = json['remark'];
    gradingTypeId = json['grading_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lower'] = lower;
    data['upper'] = upper;
    data['weight'] = weight;
    data['grade'] = grade;
    data['status'] = status;
    data['remark'] = remark;
    data['grading_type_id'] = gradingTypeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Results {
  int? id;
  String? code;
  String? name;
  String? status;
  String? coef;
  String? caMark;
  // String? examMark;
  // String? total;
  // String? grade;
  // String? remark;
  // String? weight;

  Results(
      {this.id,
        this.code,
        this.name,
        this.status,
        this.coef,
        this.caMark,
        // this.examMark,
        // this.total,
        // this.grade,
        // this.remark,
        // this.weight
      });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    status = json['status'];
    coef = json['coef'].toString();
    caMark = json['ca_mark'].toString();
    // examMark = json['exam_mark'].toString();
    // total = json['total'].toString();
    // grade = json['grade'];
    // remark = json['remark'];
    // weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['status'] = status;
    data['coef'] = coef;
    data['ca_mark'] = caMark;
    // data['exam_mark'] = examMark;
    // data['total'] = total;
    // data['grade'] = grade;
    // data['remark'] = remark;
    // data['weight'] = weight;
    return data;
  }
}
