import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class BannerRepo {
  final DioClient dioClient;
  final SharedPreferences prefs;

  BannerRepo({required this.dioClient, required this.prefs});

  // Get Banner
  Future<ApiResponse> getBanner({required int roleType}) async {
    try {
      Response response = await dioClient.get(
        ApiConstant.getBanner(roleType),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
