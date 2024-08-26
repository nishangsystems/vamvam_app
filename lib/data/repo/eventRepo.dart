import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/createEventModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class EventRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  EventRepo({required this.dioClient1, required this.prefs});

  Future<ApiResponse> createEvent(
      {required CreateEventParamsModel model}) async {
    try {
      var formData = FormData.fromMap({
        'image': model.image.isNotEmpty
            ? await MultipartFile.fromFile(model.image[0].path)
            : null,
        'video': model.video.isNotEmpty
            ? await MultipartFile.fromFile(model.video[0])
            : null,
        'leader_id': model.leaderId,
        'title': model.title,
        'description': model.description,
        'address': model.address,
        'start_date_time': model.startDateTime,
        'end_date_time': model.endDateTime,
        'lat': model.lat,
        'lng': model.lng
      });
      Response response =
          await dioClient1.post(ApiConstant.leaderCreateEvent, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getEvents(
      {String filterBy = '', required int roleType}) async {
    try {
      Response response = await dioClient1
          .post(ApiConstant.getEvents(roleType), data: {'filter_by': filterBy});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
