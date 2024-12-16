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

  static Future<void> saveSchoolID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentSchoolID', id);
  }

  static Future<String?> getSchoolID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("////////////// : ${prefs.getString('currentSchoolID')}");
    print("saving school api root: ${prefs.getString('currentSchoolID')}");
    return prefs.getString('currentSchoolID');
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
    List<String>? previousSchools = prefs.getStringList('previousSchools') ?? [];


    String schoolJson = jsonEncode(school.toJson()); // Convert to JSON string
    print("saving selected school: $schoolJson");

    previousSchools.remove(schoolJson);
    previousSchools.insert(0, schoolJson);

    await prefs.setString('school', schoolJson);
    await prefs.setStringList('previousSchools', previousSchools);
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

  // Get the list of previous schools
  static Future<List<School>> getPreviousSchools() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? previousSchoolsJson = prefs.getStringList('previousSchools') ?? [];

    List<School> previousSchools = previousSchoolsJson
        .map((schoolJson) => School.fromJson(jsonDecode(schoolJson)))
        .toList();

    print("getting previous schools: $previousSchools");

    return previousSchools;
  }

}

void loadSchoolApiRoot() async {
  String? apiRoot = await SchoolPreference.getSchoolApiRoot();
  if (apiRoot != null) {
    ApiConstant.setCurrentSchoolUrl(apiRoot);
  }

  String? id = await SchoolPreference.getSchoolID();
  if (id != null) {
    ApiConstant.setCurrentSchoolID(id);
  }
}

void onLogout() async {
  ApiConstant.resetCurrentSchoolUrl();
  await SchoolPreference.clearSchoolApiRoot();
}
