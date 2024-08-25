
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/remote/dio/dioClient3.dart';
import 'package:vam_vam/data/remote/exception/apiErrorHandler.dart';
import 'package:vam_vam/utils/apiConstant.dart';

class SchoolRepo {
  final DioClient3 dioClient;
  final SharedPreferences prefs;

  SchoolRepo({required this.dioClient, required this.prefs});

  Future<ApiResponse> getSchools() async {
    try {
      Response response = await dioClient.get(
        ApiConstant.getSchools,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}