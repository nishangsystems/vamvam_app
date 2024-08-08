class StudentProfileModel {
  String? name;
  String? matric;
  String? classes;
  String? program;
  String? department;
  String? school;
  String? currentYear;
  String? currentSemester;

  StudentProfileModel(
      {this.name,
      this.matric,
      this.classes,
      this.program,
      this.department,
      this.school,
      this.currentYear,
      this.currentSemester});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    matric = json['matric'];
    classes = json['class'];
    program = json['program'];
    department = json['department'];
    school = json['school'];
    currentYear = json['current_year'];
    currentSemester = json['current_semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['matric'] = matric;
    data['class'] = classes;
    data['program'] = program;
    data['department'] = department;
    data['school'] = school;
    data['current_year'] = currentYear;
    data['current_semester'] = currentSemester;
    return data;
  }
}
