import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class MasterRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  MasterRepo({required this.dioClient1, required this.prefs});

  Future<ApiResponse> getBatch() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.getBatch,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSemester() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.getSemester,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getLevels() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.getLevels,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
