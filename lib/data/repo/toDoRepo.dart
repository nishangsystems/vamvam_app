import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class ToDoRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  ToDoRepo({required this.dioClient1, required this.prefs});

  Future<ApiResponse> createToDo(
      {required String executiveId, required String message}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.repCreateTodo,
          data: {'executive_id': executiveId, 'message': message});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getToDo(
      {required String executiveId, required String filterDate}) async {
    try {
      if (kDebugMode) {
        print({'executive_id': executiveId, 'filter_date': filterDate});
      }
      Response response = await dioClient1.post(ApiConstant.repGetTodo,
          data: {'executive_id': executiveId, 'filter_date': filterDate});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateToDoStatus(
      {required String executiveId, required String id}) async {
    try {
      if (kDebugMode) {
        print({'executive_id': executiveId, 'id': id});
      }
      Response response = await dioClient1.post(ApiConstant.repUpdateToDoStatus,
          data: {'executive_id': executiveId, 'id': id});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
