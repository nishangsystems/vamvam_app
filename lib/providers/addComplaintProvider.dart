// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vam_vam/data/model/params/registerComplaintModelParams.dart';
import 'package:vam_vam/data/model/response/admin/leaderComplaintFollowUpModel.dart';
import 'package:vam_vam/data/model/response/admin/leaderComplaintModel.dart';
import 'package:vam_vam/data/model/response/representative/repComplaintFollowUpModel.dart';
import 'package:vam_vam/data/model/response/representative/repComplaintModel.dart';
import 'package:vam_vam/data/repo/addComplaintRepo.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/helpers/imageHelper.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';
import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/params/repComplaintFollowUpModelParams.dart';
import '../data/model/response/user/complaintCategoryModel.dart';
import '../data/model/response/user/complaintFollowUpModel.dart';
import '../data/model/response/user/complaintModel.dart';
import '../data/model/response/user/departmentModel.dart';
import '../utils/apiConstant.dart';
import '../utils/colors.dart';
import '../utils/stringResources.dart';

class AddComplaintProvider extends ChangeNotifier {
  final AddComplaintRepo addComplaintRepo;

  AddComplaintProvider({required this.addComplaintRepo});

  // User

  List<File> _pickedImages = [];
  List<File> get pickedImages => _pickedImages;

  final List<PlatformFile> _pickedAttachments = [];
  List<PlatformFile> get pickedAttachments => _pickedAttachments;

  final List<DepartmentModelData> _departmentList = [];
  List<DepartmentModelData> get departmentList => _departmentList;

  String? _selectedDepartment;
  String? get selectedDepartment => _selectedDepartment;

  final List<ComplaintCategoryModelData> _complaintCategoryList = [];
  List<ComplaintCategoryModelData> get complaintCategoryList =>
      _complaintCategoryList;

  String? _selectedComplaintCategory;
  String? get selectedComplaintCategory => _selectedComplaintCategory;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;

  final TextEditingController _locController = TextEditingController();
  TextEditingController get locController => _locController;

  // final TextEditingController _locationController = TextEditingController();
  // TextEditingController get locationController => _locationController;

  final TextEditingController _problemController = TextEditingController();
  TextEditingController get problemController => _problemController;

  final List<ComplaintModelData> _complaintList = [];
  List<ComplaintModelData> get complaintList => _complaintList;

  final List<ComplaintFollowUpModelData> _comlaintFollowUpList = [];
  List<ComplaintFollowUpModelData> get comlaintFollowUpList =>
      _comlaintFollowUpList;

  String? _lat;
  String? get lat => _lat;

  String? _lng;
  String? get lng => _lng;

  // Representative
  final List<RepCompaintModelData> _repComplaintList = [];
  List<RepCompaintModelData> get repComplaintList => _repComplaintList;

  final List<RepComplaintFollowUpModelData> _repComplaintFollowUpList = [];
  List<RepComplaintFollowUpModelData> get repComplaintFollowUpList =>
      _repComplaintFollowUpList;

  // Leader
  final List<LeaderComplaintModelData> _leaderComplaintList = [];
  List<LeaderComplaintModelData> get leaderComplaintList =>
      _leaderComplaintList;

  final List<LeaderComplaintFollowUpModelData> _leaderComplaintFollowUpList =
      [];
  List<LeaderComplaintFollowUpModelData> get leaderComplaintFollowUpList =>
      _leaderComplaintFollowUpList;

  setLat(String value) {
    _lat = value;
    notifyListeners();
  }

  setLng(String value) {
    _lng = value;
    notifyListeners();
  }

  setSelectedDepartment(String? newValue) {
    _selectedDepartment = newValue;
    notifyListeners();
  }

  String? getDepartmentId(String value) {
    String? id;
    for (var element in _departmentList) {
      if (element.name == value) {
        id = element.id;
      }
    }
    return id;
  }

  setSelectedCategory(String? newValue) {
    _selectedComplaintCategory = newValue;
    notifyListeners();
  }

  setAdressController(String value) {
    _addressController.text = value;
    _addressController.selection = TextSelection.fromPosition(
        TextPosition(offset: _addressController.text.length));
    notifyListeners();
  }

  String? getCategoryId(String value) {
    String? id;
    for (var element in _complaintCategoryList) {
      if (element.name == value) {
        id = element.id;
      }
    }
    return id;
  }

  // Pick image from camera
  pickCameraImg() async {
    try {
      String? file = await ImageHelper().getImagePicker(ImageSource.camera);
      file != null ? print("--->$file") : print("image not found");
      // if (_pickedImages.length < 3) {
      //   if (_pickedImages.length < 3) {
      //     // image
      //       if (image!.path != null) {
      //         setPickedImage(File(image.path));
      //       }
      //     // });
      //   }
      // }
    } catch (e) {
      customToast(msg: 'Image upload failed!', color: errorColor);
      rethrow;
    }
  }

  setPickedImage(File file) {
    _pickedImages.add(file);
    notifyListeners();
  }

  setPickedAttachments(PlatformFile file) {
    _pickedAttachments.add(file);
    notifyListeners();
  }

  // Pick image from Gallery
  pickGalleryImg() {
    try {
      Future<List<XFile>?> images = ImageHelper().getMultiImagePicker();
      images.then((value) {
        if (value != null) {
          for (var element in value) {
            if (_pickedImages.length < 3) {
              setPickedImage(File(element.path));
            }
          }
        }
      });
    } catch (e) {
      customToast(msg: 'Image upload failed!', color: errorColor);
      rethrow;
    }
  }

  pickVideoImg() {
    try {
      Future<List<XFile>?> images = ImageHelper().getMultiImagePicker();
      images.then((value) {
        if (value != null) {
          for (var element in value) {
            if (_pickedImages.length < 3) {
              setPickedImage(File(element.path));
            }
          }
        }
      });
    } catch (e) {
      customToast(msg: 'Image upload failed!', color: errorColor);
      rethrow;
    }
  }

  removePickedImage(int index) {
    List<File> images = [];
    for (var i = 0; i < _pickedImages.length; i++) {
      if (index != i) {
        images.add(_pickedImages[i]);
      }
    }
    _pickedImages = images;
    notifyListeners();
  }

  clearPickedAttachment() {
    _pickedAttachments.clear();
    notifyListeners();
  }

  addSpeechToText(String value) {
    _problemController.text = ' $value';
    _problemController.selection = TextSelection.fromPosition(
        TextPosition(offset: _problemController.text.length));
    notifyListeners();
  }

  // Pick attachments
  pickAttachment() {
    try {
      ImageHelper().pickAttachment().then((value) {
        if (value.isNotEmpty) {
          for (var element in value) {
            int sizeInBytes = File(element.path.toString()).lengthSync();
            double sizeInMb = sizeInBytes / (1024 * 1024);
            if (sizeInMb > 8) {
              errorToast(msg: 'Video Should not greater then 8 MB');
            } else {
              setPickedAttachments(element);
            }
          }
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //----------------------------- Apis Section ------------------------------------

  //----------------------------- USER APIS --------------------------------
  // Get Department
  Future<ResponseModel> getDepartment() async {
    disposeMethod();
    startLoader(true);
    ApiResponse apiResponse = await addComplaintRepo.getDepartment();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        _departmentList.clear();
        notifyListeners();
        map['data'].forEach((item) {
          DepartmentModelData model = DepartmentModelData.fromJson(item);
          _departmentList.add(model);
          notifyListeners();
        });
        getComplaintCategory();
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
    return responseModel;
  }

  // Get Complaint Categories
  Future<ResponseModel> getComplaintCategory() async {
    ApiResponse apiResponse = await addComplaintRepo.getComplaintCategory();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        _complaintCategoryList.clear();
        notifyListeners();
        map['data'].forEach((item) {
          ComplaintCategoryModelData model =
              ComplaintCategoryModelData.fromJson(item);
          _complaintCategoryList.add(model);
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

  // Register Compaint
  Future<ResponseModel> registerComplaint(
      RegisterComplaintModelParams registerComplaintModelParams,
      BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await addComplaintRepo.registerComplaint(
        model: registerComplaintModelParams);
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
        disposeMethod();
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

  // Get Compaint List
  Future<ResponseModel> getComplaints(
      String userId, String filterBy, BuildContext context) async {
    startLoader(true);
    _complaintList.clear();
    notifyListeners();
    ApiResponse apiResponse = await addComplaintRepo.getComplaints(
        userId: userId, filterBy: filterBy);
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
        _complaintList.clear();
        notifyListeners();
        map['data'].forEach((element) {
          ComplaintModelData complaintModelData =
              ComplaintModelData.fromJson(element);
          _complaintList.add(complaintModelData);
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

  // Get Compaint Follow-up List
  Future<ResponseModel> getComplaintFollowUp(String complaintId) async {
    startLoader(true);
    _comlaintFollowUpList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await addComplaintRepo.getComplaintFollowUp(complaintId: complaintId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((element) {
          ComplaintFollowUpModelData model =
              ComplaintFollowUpModelData.fromJson(element);
          _comlaintFollowUpList.add(model);
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

  // Withdraw Complaint
  Future<ResponseModel> withdrawComplaint(String complaintId) async {
    startLoader(true);
    notifyListeners();
    ApiResponse apiResponse =
        await addComplaintRepo.withdrawComplaint(complaintId: complaintId);
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

  // Reopen Complaint
  Future<ResponseModel> reopenComplaint(String complaintId) async {
    startLoader(true);
    notifyListeners();
    ApiResponse apiResponse =
        await addComplaintRepo.reopenComplaint(complaintId: complaintId);
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

  // Reopen Complaint
  Future<ResponseModel> reviewComplaint(
      String complaintId, String message, List<String> mediaFiles) async {
    startLoader(true);
    notifyListeners();
    ApiResponse apiResponse = await addComplaintRepo.reviewComplaint(
        complaintId: complaintId, message: message, mediaFiles: mediaFiles);
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

  //----------------------------- Representative APIS --------------------------------

  // Get Compaints (Executive)....
  Future<ResponseModel> getRepComplaints(
      String executiveId, String filterBy) async {
    startLoader(true);
    _repComplaintList.clear();
    notifyListeners();
    ApiResponse apiResponse = await addComplaintRepo.getRepComplaints(
        executiveId: executiveId, filterBy: filterBy);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((element) {
          RepCompaintModelData model = RepCompaintModelData.fromJson(element);
          _repComplaintList.add(model);
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

  // Get Compaints Follow Up (Executive)....
  Future<ResponseModel> repGetComplaintFollowUp(
      String executiveId, String complaintId) async {
    startLoader(true);
    _repComplaintFollowUpList.clear();
    notifyListeners();
    ApiResponse apiResponse = await addComplaintRepo.repGetComplaintFollowUp(
        executiveId: executiveId, complaintId: complaintId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((element) {
          RepComplaintFollowUpModelData model =
              RepComplaintFollowUpModelData.fromJson(element);
          _repComplaintFollowUpList.add(model);
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

  // Get Compaints Follow Up (Executive)....
  Future<ResponseModel> repComplaintFollowUp(
      RepComplaintFollowUpModelParams model) async {
    startLoader(true);
    _repComplaintFollowUpList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await addComplaintRepo.repComplaintFollowUp(model: model);
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

  Future<ResponseModel> leaderGetComplaint({String status = ''}) async {
    startLoader(true);
    ApiResponse apiResponse = await addComplaintRepo.leaderGetComplaint();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        _leaderComplaintList.clear();
        notifyListeners();
        if (status == '') {
          map['data'].forEach((item) {
            LeaderComplaintModelData model =
                LeaderComplaintModelData.fromJson(item);
            _leaderComplaintList.add(model);
            notifyListeners();
          });
        } else {
          map['data'].forEach((item) {
            if (item['status_string'] == status) {
              LeaderComplaintModelData model =
                  LeaderComplaintModelData.fromJson(item);
              _leaderComplaintList.add(model);
            }
            notifyListeners();
          });
        }

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

  // Get Compaints Follow Up (Executive)....
  Future<ResponseModel> leaderGetComplaintFollowUp(String complaintId) async {
    startLoader(true);
    _leaderComplaintFollowUpList.clear();
    notifyListeners();
    ApiResponse apiResponse = await addComplaintRepo.leaderGetComplaintFollowUp(
        complaintId: complaintId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((element) {
          LeaderComplaintFollowUpModelData model =
              LeaderComplaintFollowUpModelData.fromJson(element);
          _leaderComplaintFollowUpList.add(model);
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

  //----------------------------- Dispose Section -----------------------------

  disposeMethod() {
    clearSelectedDepartment();
    clearComplaintCategory();
    clearAddress();
    clearLoc();
    clearProblem();
    clearLanLng();
    clearSelectedImage();
    clearAttachments();
  }

  clearSelectedImage() {
    _pickedImages.clear();
    notifyListeners();
  }

  clearAttachments() {
    _pickedAttachments.clear();
    notifyListeners();
  }

  clearSelectedDepartment() {
    _selectedDepartment = null;
    notifyListeners();
  }

  clearComplaintCategory() {
    _selectedComplaintCategory = null;
    notifyListeners();
  }

  clearAddress() {
    _addressController.clear();
    notifyListeners();
  }

  clearLoc() {
    _locController.clear();
    notifyListeners();
  }

  clearProblem() {
    _problemController.clear();
    notifyListeners();
  }

  clearLanLng() {
    _lat = null;
    _lng = null;
    notifyListeners();
  }
}
