import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/updateProfileModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';

import '../../helpers/enumHelper.dart';
import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/dio/dioClient1.dart';
import '../remote/exception/apiErrorHandler.dart';

class ProfileRepo {
  final DioClient1 dioClient1;

  ProfileRepo({required this.dioClient1});

  // Get Profile
  Future<ApiResponse> getProfile(
      {required String userId, required int roleType}) async {
    try {

      print(roleType == getRoleType(RoleEnum.student)
          ? {'user_id': userId}
          : roleType == getRoleType(RoleEnum.teacher)
          ? {'executive_id': userId}
          : roleType == getRoleType(RoleEnum.parent)
          ? {'parent_id': userId}
          : {'leader_id': userId});

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(ApiConstant.keyToken)!;

      if(roleType == getRoleType(RoleEnum.teacher)){

        Response response = await dioClient1.get(ApiConstant.getProfile(roleType),
            data: roleType == getRoleType(RoleEnum.student)
                ? {'user_id': userId}
                : roleType == getRoleType(RoleEnum.teacher)
                ? {'teacher': userId}
                : roleType == getRoleType(RoleEnum.parent)
                ? {'parent_id': userId}
                : {'leader_id': userId},
            options: Options(headers:{'id': userId, 'Content-Type': 'application/json; charset=UTF-8',
              'authorizationToken': "Bearer $token",} )
        );
        return ApiResponse.withSuccess(response);
      }else{

        Response response = await dioClient1.get(ApiConstant.getProfile(roleType),
            data: roleType == getRoleType(RoleEnum.student)
                ? {'user_id': userId}
                : roleType == getRoleType(RoleEnum.teacher)
                ? {'teacher': userId}
                : roleType == getRoleType(RoleEnum.parent)
                ? {'parent_id': userId}
                : {'leader_id': userId},
            options: Options(headers:{'id': userId, 'Content-Type': 'application/json; charset=UTF-8',
              'authorizationToken': "Bearer $token",} )
        );
        return ApiResponse.withSuccess(response);
      }




    } catch (e) {
      print("///////////");
      print(e);
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Student Profile
  Future<ApiResponse> getStudentProfile() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.getStudentProfile,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage('$e'));
    }
  }

  // Update Profile
  Future<ApiResponse> updateProfile(
      {required UpdateProfileModelParams updateProfileModelParams}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.updateProfile,
          data: updateProfileModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
