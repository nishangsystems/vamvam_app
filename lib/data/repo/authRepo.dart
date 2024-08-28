import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/loginModelParams.dart';
import 'package:vam_vam/data/model/params/verifyOtpModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/dio/dioClient1.dart';
import '../remote/exception/apiErrorHandler.dart';

class AuthRepo {
  final DioClient1 dioClient1;
  SharedPreferences prefs;

  AuthRepo(
      {required this.prefs, required this.dioClient1});

  // Login
  Future<ApiResponse> login(
      {required LoginModelParams loginModelParams,
      required int roleType}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.getLogin(roleType),
          data: loginModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Login -- vam_vam
  Future<ApiResponse> login1(
      {required String userName, required String password}) async {
    try {
      Response response = await dioClient1.get(ApiConstant.login1,
          data: {'matric': userName, 'password': password});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Teacher Login -- vam_vam
  Future<ApiResponse> teacherLogin(
      {required String email, required String password}) async {
    try {
      Response response = await dioClient1
          .get('${ApiConstant.teacherLogin}$email&password=$password');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Parent Login -- vam_vam
  Future<ApiResponse> parentLogin(
      {required String phone, required String password}) async {
    try {
      Response response = await dioClient1
          .get('${ApiConstant.parentLogin}$phone&password=$password');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Parent get Profile -- vam_vam
  Future<ApiResponse> getParentProfile() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getParentProfile);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Logout -- vam_vam
  Future<ApiResponse> logout() async {
    try {
      Response response = await dioClient1.get(ApiConstant.logout);
      ApiConstant.resetCurrentSchoolUrl();
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // verify otp
  Future<ApiResponse> verifyOtp(
      {required VerifyOtpModelParams verifyOtpModelParams,
      required int roleType}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.getVerifyOtp(roleType),
          data: verifyOtpModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Save user id and user token
  saveUserIdAndToken(
    String token,
    String id,
  ) async {
    dioClient1.token = token;
    dioClient1.id = id;
    dioClient1.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'id': id,
      'authorizationToken': token,
    };
    try {
      await prefs.setString(ApiConstant.keyToken, token);
      await prefs.setString(ApiConstant.keyUserId, id);
    } catch (e) {
      rethrow;
    }
  }

  saveUserIdAndToken1(
    String token,
    String id,
  ) async {
    dioClient1.token = 'Bearer $token';
    dioClient1.id = id;
    dioClient1.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'id': id,
      'Authorization': 'Bearer $token',
    };
    try {
      await prefs.setString(ApiConstant.keyToken, token);
      await prefs.setString(ApiConstant.keyUserId, id);
    } catch (e) {
      rethrow;
    }
  }

  // Get User Token
  String getUserToken() {
    return prefs.getString(ApiConstant.keyToken) ?? "";
  }

  // SAVE ACADEMIC YEAR
  saveAcademicYear(String year) {
    return prefs.setString(ApiConstant.academicYear, year);
  }

  // GET ACADEMIC YEAR
  String? getAcademicYear(String year) {
    return prefs.getString(ApiConstant.academicYear);
  }

  // SAVE SEMESTER
  saveSemester(String semester) {
    return prefs.setString(ApiConstant.semester, semester);
  }

  // GET SEMESTER YEAR
  String? getSemester(String year) {
    return prefs.getString(ApiConstant.semester);
  }

  // Get User Id
  String getUserId() {
    return prefs.getString(ApiConstant.keyUserId) ?? "";
  }

  // Check user is logged in or not
  bool isLoggedIn() {
    return prefs.containsKey(ApiConstant.keyToken) &&
        prefs.containsKey(ApiConstant.keyUserId);
  }

  // clear local data
  Future<bool> clearSharedData() async {
    await prefs.remove(ApiConstant.keyToken);
    await prefs.remove(ApiConstant.keyUserId);
    // await prefs.remove(ApiConstant.keyToken1);
    // await prefs.remove(ApiConstant.keyUserId1);
    return true;
  }
}
