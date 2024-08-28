import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:dio/dio.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class ResultRepo {
  final DioClient1 dioClient1;

  ResultRepo({
    required this.dioClient1,
  });

  Future<ApiResponse> getExamResult(
      {required String semesterId, required String batchId}) async {
    try {
      Response response = await dioClient1
          .get("${ApiConstant.getExamResult}$semesterId&year=$batchId");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCaResult(
      {required String semesterId, required String batchId}) async {
    try {
      Response response = await dioClient1
          .get("${ApiConstant.getCaResult}$semesterId&year=$batchId");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getFees() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getFees);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getFaqs() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getFaqs);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> downloadResult(
      {required String semesterId, required String batchId}) async {
    try {
      Response response = await dioClient1
          .get("${ApiConstant.downloadResult}$semesterId&year=$batchId");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }
}
