import 'package:flutter/material.dart';
import 'package:vam_vam/data/repo/toDoRepo.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/toDoModel.dart';
import '../utils/apiConstant.dart';

class ToDoProvider extends ChangeNotifier {
  final ToDoRepo toDoRepo;

  ToDoProvider({required this.toDoRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ToDoModelData> _toDoList = [];
  List<ToDoModelData> get toDoList => _toDoList;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<ResponseModel> createToDo(
      {required String executiveId, required String message}) async {
    startLoader(true);
    ApiResponse apiResponse =
        await toDoRepo.createToDo(executiveId: executiveId, message: message);
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
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

  Future<ResponseModel> getToDo(
      {required String executiveId, required String filterDate}) async {
    startLoader(true);
    _toDoList.clear();
    notifyListeners();
    ApiResponse apiResponse = await toDoRepo.getToDo(
        executiveId: executiveId, filterDate: filterDate);
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        responseModel = ResponseModel(true, map['message']);
        map['data'].forEach((item) {
          ToDoModelData model = ToDoModelData.fromJson(item);
          _toDoList.add(model);
          notifyListeners();
        });
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

  Future<ResponseModel> updateToDoStatus(
      {required String executiveId, required String id}) async {
    startLoader(true);
    ApiResponse apiResponse =
        await toDoRepo.updateToDoStatus(executiveId: executiveId, id: id);
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
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
}
