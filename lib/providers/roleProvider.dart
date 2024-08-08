import 'package:flutter/material.dart';
import 'package:vam_vam/data/repo/roleRepo.dart';

import '../widgets/commonWidgets/commonWidgets.dart';

class RoleProvider extends ChangeNotifier {
  final RoleRepo roleRepo;

  RoleProvider({required this.roleRepo});

  int _roleType = 0;
  int get roleType => _roleType;

  setRoleType(int value) {
    _roleType = value;
    notifyListeners();
    roleRepo.saveUserRole(value);
    if (value == 0) {
      appBarHeight = 100;
    } else {
      appBarHeight = 80;
    }
  }

  int getRoleType() {
    setRoleType(roleRepo.getUserRole());
    return roleRepo.getUserRole();
  }

  saveOnboarding() {
    roleRepo.saveOnBoarding();
  }

  bool getOnBoarding() {
    return roleRepo.getOnBoarding();
  }
}
