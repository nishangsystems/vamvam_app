// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:async';

import 'package:vam_vam/data/model/faqModel.dart';
import 'package:vam_vam/data/model/response/caResultModel.dart';
import 'package:vam_vam/data/model/response/examResultModel.dart';
import 'package:vam_vam/data/repo/resultRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/feesModel.dart';
import '../widgets/commonWidgets/commonWidgets.dart';

class ResultProvider extends ChangeNotifier {
  final ResultRepo resultRepo;

  ResultProvider({required this.resultRepo});

  bool _loader = false;
  bool get loader => _loader;

  startLoader(bool value) {
    _loader = value;
    notifyListeners();
  }

  // Get EXAM Result
  ExamResultModel _examResultModel = ExamResultModel();
  ExamResultModel get examResultModel => _examResultModel;

  clearExamResult() {
    _examResultModel = ExamResultModel();
    notifyListeners();
  }

  Future<ResponseModel> getExamResult(
      {String? semesterId, String? batchId}) async {
    startLoader(true);
    ApiResponse apiResponse = await resultRepo.getExamResult(
        batchId: batchId ?? "", semesterId: semesterId ?? '');
    clearExamResult();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map != null && map.isEmpty) {
        responseModel = ResponseModel(false, 'Something Went Wrong!');
      } else {
        startLoader(false);
        _examResultModel = ExamResultModel.fromJson(map);
        // runZonedGuarded(() =>
        //     (error, stack) {
        //   print('ERRROR>>> $error, Stackk>> $stack');
        // });
        responseModel = ResponseModel(true, 'Success!');
      }
    } else {
      startLoader(false);
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

  // Get CA results
  CAResultModel _caResultModel = CAResultModel();
  CAResultModel get caResultModel => _caResultModel;

  clearCaResult() {
    _caResultModel = CAResultModel();
    notifyListeners();
  }

  Future<ResponseModel> getCaResult(
      {String? semesterId, String? batchId}) async {
    startLoader(true);
    ApiResponse apiResponse = await resultRepo.getCaResult(
        batchId: batchId ?? "", semesterId: semesterId ?? '');
    clearCaResult();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map != null && map.isEmpty) {
        responseModel = ResponseModel(false, 'Something Went Wrong!');
      } else {
        startLoader(false);
        _caResultModel = CAResultModel.fromJson(map);
        responseModel = ResponseModel(true, 'Success!');
      }
    } else {
      startLoader(false);
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

  // Get Fees api
  FeesModel? _feesData = FeesModel();
  FeesModel? get feesData => _feesData;

  // filtered Fees
  FeesModel? _filteredFeesData = FeesModel();
  FeesModel? get filteredFeesData => _filteredFeesData;

  clearFees() {
    _feesData = FeesModel();
    notifyListeners();
  }

  Future<ResponseModel> getFees() async {
    clearFees();
    startLoader(true);
    ApiResponse apiResponse = await resultRepo.getFees();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map != null && map.isEmpty) {
        responseModel = ResponseModel(false, 'Something Went Wrong!');
      } else {
        _feesData = FeesModel.fromJson(map);
        _filteredFeesData = FeesModel.fromJson(map);
        responseModel = ResponseModel(true, 'Success!');
      }
    } else {
      startLoader(false);
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

  Object? filterFeesByBatchId(List<Payments> feeReportsJson, String batchId) {
    List<Payments> feeReports = feeReportsJson.toList();

    // filter _feesData
    var filtered = _feesData?.data!.payments!.where((report) => report.batchId == int.parse(batchId)).toList();
    if (filtered != null && filtered.isNotEmpty) {
      _filteredFeesData?.data!.payments = filtered;
      print("filtered: ${_filteredFeesData?.data!.payments}");
      notifyListeners();
      return filtered;
    } else {
      _filteredFeesData?.data!.payments = [];
      notifyListeners();
      print("empty results: ${_filteredFeesData?.data!.payments}");
       return [];
    }
  }

  // Get FAQ api
  final List<FaqModel> _faqList = [];
  List<FaqModel> get faqList => _faqList;

  clearFaqList() {
    _faqList.clear();
    notifyListeners();
  }

  Future<ResponseModel> getFaqs() async {
    clearFaqList();
    startLoader(true);
    ApiResponse apiResponse = await resultRepo.getFaqs();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['data'] == null && map['data'].isEmpty) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        map['data'].forEach((element) {
          FaqModel model = FaqModel.fromJson(element);
          _faqList.add(model);
        });
        responseModel = ResponseModel(true, 'Success!');
      }
    } else {
      startLoader(false);
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



  // Download Exam Result
  Future<ResponseModel> downloadResult(
      {required String semesterId, required String batchId}) async {
    startLoader(true);
    ApiResponse apiResponse = await resultRepo.downloadResult(
        batchId: batchId, semesterId: semesterId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['status'] != 'success') {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        downloadPdf(map['url'] ?? '');
        responseModel = ResponseModel(true, map['message'] ?? 'Success!');
      }
    } else {
      startLoader(false);
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

  downloadPdf(String url) async {
    startLoader(true);
    try {
      final directory = await getDownloadsDirectory();
      print("here");
      print(url);
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: directory!.path,
        showNotification: true,
        openFileFromNotification: true,
        requiresStorageNotLow: true,
        saveInPublicStorage: true,
      );
      successToast(msg: 'Downloaded');
      startLoader(false);
    } catch (e, st) {
      print(e);
      print(st);
      errorToast(msg: 'Failed: $e');
      rethrow;
    }
  }
}
