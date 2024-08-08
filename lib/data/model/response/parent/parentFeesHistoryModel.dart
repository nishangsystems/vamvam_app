class ParentFeesHistoryModel {
  Data? data;

  ParentFeesHistoryModel({this.data});

  ParentFeesHistoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  Student? student;
  String? totalPaid;
  String? totalDebt;
  List<Payments>? payments;

  Data({this.student, this.totalPaid, this.totalDebt, this.payments});

  Data.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    totalPaid = json['total_paid'];
    totalDebt = json['total_debt'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    data['total_paid'] = totalPaid;
    data['total_debt'] = totalDebt;
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
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
  String? programStatus;
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
      this.programStatus,
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
    programStatus = json['program_status'];
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
    data['program_status'] = programStatus;
    data['parent_name'] = parentName;
    data['parent_phone_number'] = parentPhoneNumber;
    data['campus_id'] = campusId;
    data['program_id'] = programId;
    data['imported'] = imported;
    data['active'] = active;
    return data;
  }
}

class Payments {
  int? id;
  int? paymentId;
  int? debt;
  int? studentId;
  int? batchId;
  int? unitId;
  int? amount;
  int? paymentYearId;
  String? importReference;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? bankId;
  String? referenceNumber;
  int? userId;
  String? paidBy;
  String? transactionId;

  Payments(
      {this.id,
      this.paymentId,
      this.debt,
      this.studentId,
      this.batchId,
      this.unitId,
      this.amount,
      this.paymentYearId,
      this.importReference,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.bankId,
      this.referenceNumber,
      this.userId,
      this.paidBy,
      this.transactionId});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentId = json['payment_id'];
    debt = json['debt'];
    studentId = json['student_id'];
    batchId = json['batch_id'];
    unitId = json['unit_id'];
    amount = json['amount'];
    paymentYearId = json['payment_year_id'];
    importReference = json['import_reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    bankId = json['bank_id'];
    referenceNumber = json['reference_number'];
    userId = json['user_id'];
    paidBy = json['paid_by'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payment_id'] = paymentId;
    data['debt'] = debt;
    data['student_id'] = studentId;
    data['batch_id'] = batchId;
    data['unit_id'] = unitId;
    data['amount'] = amount;
    data['payment_year_id'] = paymentYearId;
    data['import_reference'] = importReference;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['bank_id'] = bankId;
    data['reference_number'] = referenceNumber;
    data['user_id'] = userId;
    data['paid_by'] = paidBy;
    data['transaction_id'] = transactionId;
    return data;
  }
}
