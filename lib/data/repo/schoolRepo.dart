
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:vam_vam/data/remote/dio/dioClient3.dart';
import 'package:vam_vam/data/remote/exception/apiErrorHandler.dart';
import 'package:vam_vam/utils/apiConstant.dart';

class SchoolRepo {
  final DioClient3 dioClient3;
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  SchoolRepo({required this.dioClient3, required this.dioClient1, required this.prefs});

  Future<ApiResponse> getSchools() async {
    try {
      Response response = await dioClient3.get(
        ApiConstant.getSchools,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // get current user's school
  Future<ApiResponse> getSchool() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.getSchool,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}