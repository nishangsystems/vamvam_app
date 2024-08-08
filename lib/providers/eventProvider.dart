// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/eventModel.dart';
import 'package:vam_vam/data/repo/eventRepo.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../utils/apiConstant.dart';
import '../utils/stringResources.dart';

class EventProvider extends ChangeNotifier {
  final EventRepo eventRepo;

  EventProvider({required this.eventRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<EventModelData> _eventList = [];
  List<EventModelData> get eventList => _eventList;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<ResponseModel> createEvent(
      createEventParamsModel, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse =
        await eventRepo.createEvent(model: createEventParamsModel);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        responseModel = ResponseModel(true, map['message']);
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }

  Future<ResponseModel> getEvents(
      String? filterBy, int roleType, BuildContext context) async {
    startLoader(true);
    _eventList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await eventRepo.getEvents(filterBy: filterBy ?? '', roleType: roleType);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          EventModelData model = EventModelData.fromJson(item);
          _eventList.add(model);
          notifyListeners();
        });
        responseModel = ResponseModel(true, map['message']);
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }
}
