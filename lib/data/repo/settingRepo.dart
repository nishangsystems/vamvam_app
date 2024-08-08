import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/helpers/enumHelper.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class SettingRepo {
  final DioClient dioClient;
  final SharedPreferences prefs;

  SettingRepo({required this.dioClient, required this.prefs});

  // Delete Account
  Future<ApiResponse> deleteAccount(
      {required String userId, required int roleType}) async {
    try {
      Response response =
          await dioClient.post(ApiConstant.getDeleteAccount(roleType),
              data: roleType == getRoleType(RoleEnum.student)
                  ? {'user_id': userId}
                  : roleType == getRoleType(RoleEnum.teacher)
                      ? {'executive_id': userId}
                      : {'leader_id': userId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
