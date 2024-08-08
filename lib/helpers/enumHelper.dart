// ignore_for_file: file_names

enum RoleEnum { student, teacher, parent, leader }

enum PrivacyTermsEnum { privacy, terms, about }

int getRoleType(RoleEnum status) {
  switch (status) {
    case RoleEnum.student:
      return 0;
    case RoleEnum.leader:
      return 1;
    case RoleEnum.parent:
      return 3;
    default:
      return 2;
  }
}
