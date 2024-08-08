import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/utils/apiConstant.dart';

class RoleRepo {
  final SharedPreferences prefs;

  RoleRepo({required this.prefs});

  saveUserRole(int value) {
    prefs.setInt(ApiConstant.keyRole, value);
  }

  int getUserRole() {
    return prefs.getInt(ApiConstant.keyRole) ?? 0;
  }

  saveOnBoarding() {
    prefs.setBool(ApiConstant.keyOnboarding, true);
  }

  bool getOnBoarding() {
    return prefs.getBool(ApiConstant.keyOnboarding) ?? false;
  }
}
