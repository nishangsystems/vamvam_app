import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:vam_vam/helpers/enumHelper.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class ForgotPasswordRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  ForgotPasswordRepo({required this.dioClient1, required this.prefs});

  // Forget Password
  Future<ApiResponse> forgetPassword(
      {required String email, required int roleType}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.getforgetPassword(roleType),
          data: {'email': email});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // verify Otp
  Future<ApiResponse> verifyOtp(
      {required String email,
      required String otp,
      required String userId,
      required int roleType}) async {
    try {
      Response response =
          await dioClient1.post(ApiConstant.getForgetPasswordVerifyOtp(roleType),
              data: roleType == getRoleType(RoleEnum.student)
                  ? {'email': email, 'otp': otp, 'user_id': userId}
                  : roleType == getRoleType(RoleEnum.teacher)
                      ? {'email': email, 'otp': otp, 'executive_id': userId}
                      : {'email': email, 'otp': otp, 'leader_id': userId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Reset Password
  Future<ApiResponse> resetPassword(
      {required String userId,
      required String password,
      required int roleType}) async {
    try {
      Response response =
          await dioClient1.post(ApiConstant.getResetPassword(roleType),
              data: roleType == getRoleType(RoleEnum.student)
                  ? {'user_id': userId, 'password': password}
                  : roleType == getRoleType(RoleEnum.teacher)
                      ? {'executive_id': userId, 'password': password}
                      : {'leader_id': userId, 'password': password});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
