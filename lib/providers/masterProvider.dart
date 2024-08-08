import 'package:flutter/material.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/batchModel.dart';
import '../data/model/response/levelModel.dart';
import '../data/model/response/semesterModel.dart';
import '../data/repo/masterRepo.dart';
import '../utils/apiConstant.dart';

class MasterProvider extends ChangeNotifier {
  final MasterRepo masterRepo;

  MasterProvider({required this.masterRepo});

  bool _loader = false;
  bool get loader => _loader;

  startLoader(bool value) {
    _loader = value;
    notifyListeners();
  }

  //--------------------- Get Batch Api ---------------------
  final List<BatchModel> _batchList = [];
  List<BatchModel> get batchList => _batchList;

  final List<int> _selectedBatch = [];
  List<int> get selectedBatch => _selectedBatch;

  String? getBatchId(String? batch) {
    String? id;
    for (var element in _batchList) {
      if (element.name == batch) {
        id = element.id.toString();
      }
    }
    return id;
  }

  setSelectedBatch(int id) {
    if (_selectedBatch.contains(id)) {
      _selectedBatch.remove(id);
    } else {
      _selectedBatch.add(id);
    }
    notifyListeners();
  }

  clearSelectedBatch() {
    _selectedBatch.clear();
    notifyListeners();
  }

  Future<ResponseModel> getBatch() async {
    startLoader(true);
    _batchList.clear();
    ApiResponse apiResponse = await masterRepo.getBatch();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['data'] == null || map['data'].isEmpty) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        map['data'].forEach((element) {
          BatchModel model = BatchModel.fromJson(element);
          _batchList.add(model);
          notifyListeners();
        });
        responseModel = ResponseModel(true, map['message'] ?? 'Success');
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else if (apiResponse.error != null) {
        errorMessage = apiResponse.error.errors[0].message;
      } else {
        errorMessage = apiResponse.response!.data['message'];
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    startLoader(false);
    notifyListeners();
    return responseModel;
  }

  //--------------------- Get Semester Api ---------------------
  final List<SemesterModel> _semesterList = [];
  List<SemesterModel> get semesterList => _semesterList;

  final List<int> _selectedSemester = [];
  List<int> get selectedSemester => _selectedSemester;

  String? getSemesterId(String? sem) {
    String? id;
    for (var element in _semesterList) {
      if (element.name == sem) {
        id = element.id.toString();
      }
    }
    return id;
  }

  setSelectedSemester(int id) {
    if (_selectedSemester.contains(id)) {
      _selectedSemester.remove(id);
    } else {
      _selectedSemester.add(id);
    }
    notifyListeners();
  }

  clearSelectedSemester() {
    _selectedSemester.clear();
    notifyListeners();
  }

  Future<ResponseModel> getSemester() async {
    _semesterList.clear;
    startLoader(true);
    ApiResponse apiResponse = await masterRepo.getSemester();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        if (map['semesters'] != null) {
          map['semesters'].forEach((element) {
            SemesterModel model = SemesterModel.fromJson(element);
            _semesterList.add(model);
            notifyListeners();
          });
          responseModel = ResponseModel(true, map['message'] ?? 'Success');
        } else {
          responseModel =
              ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
        }
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else if (apiResponse.error != null) {
        // errorMessage = apiResponse.response!.data['msg'];
        errorMessage = apiResponse.error.errors[0].message;
      } else {
        errorMessage = apiResponse.response!.data['message'];
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    startLoader(false);
    notifyListeners();
    return responseModel;
  }

  //--------------------- Get Level API ---------------------
  final List<LevelModel> _levelList = [];
  List<LevelModel> get levelList => _levelList;

  final List<int> _selectedLevel = [];
  List<int> get selectedLevel => _selectedLevel;

  String? getLevelId(String? level) {
    String? id;
    for (var element in _levelList) {
      if (element.level == level) {
        id = element.id.toString();
      }
    }
    return id;
  }

  setSelectedLevel(int id) {
    if (_selectedLevel.contains(id)) {
      _selectedLevel.remove(id);
    } else {
      _selectedLevel.add(id);
    }
    notifyListeners();
  }

  clearSelectedLevel() {
    _selectedLevel.clear();
    notifyListeners();
  }

  Future<ResponseModel> getLevels() async {
    _levelList.clear();
    startLoader(true);
    ApiResponse apiResponse = await masterRepo.getLevels();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['status'] != successCode1) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['levels'].forEach((element) {
          LevelModel model = LevelModel.fromJson(element);
          _levelList.add(model);
        });
        notifyListeners();
        responseModel = ResponseModel(true, map['message'] ?? 'Success');
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else if (apiResponse.error != null) {
        errorMessage = apiResponse.error.errors[0].message;
      } else {
        errorMessage = apiResponse.response!.data['message'];
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    startLoader(false);
    notifyListeners();
    return responseModel;
  }
}
