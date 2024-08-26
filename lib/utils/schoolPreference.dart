import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/utils/apiConstant.dart';

import '../data/repo/schoolRepo.dart';

class SchoolPreference {
  static Future<void> saveSchoolApiRoot(String apiRoot) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("saving school api root: $apiRoot");
    await prefs.setString('currentSchoolUrl', apiRoot);
  }

  static Future<String?> getSchoolApiRoot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("getting school api root: ${prefs.getString('currentSchoolUrl')}");
    return prefs.getString('currentSchoolUrl');
  }

  static Future<void> clearSchoolApiRoot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentSchoolUrl');
  }

  // save previous logged in school
  static Future<void> saveSchool(School school) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String schoolJson = jsonEncode(school.toJson()); // Convert to JSON string
    print("saving selected school: $schoolJson");
    await prefs.setString('school', schoolJson);
  }

  // get previous logged in school
  static Future<School?> getSchool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schoolJson = prefs.getString('school');
    if (schoolJson != null) {
      return School.fromJson(jsonDecode(schoolJson));
    }
    return null;
  }
}

// void onSchoolSelected(School selectedSchool) async {
//   ApiConstant.setCurrentSchoolUrl(selectedSchool.api_root!);
//   await SchoolPreference.saveSchoolApiRoot(selectedSchool.api_root!);
// }

void loadSchoolApiRoot() async {
  String? apiRoot = await SchoolPreference.getSchoolApiRoot();
  if (apiRoot != null) {
    ApiConstant.setCurrentSchoolUrl(apiRoot);
  }
}

void onLogout() async {
  ApiConstant.resetCurrentSchoolUrl();
  await SchoolPreference.clearSchoolApiRoot();
}
