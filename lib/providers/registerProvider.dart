import 'package:flutter/widgets.dart';
import 'package:vam_vam/data/model/params/registerModelParams.dart';
import 'package:vam_vam/data/model/params/wardModelParams.dart';
import 'package:vam_vam/data/model/response/user/WardModel.dart';
import 'package:vam_vam/data/model/response/user/municipalityModel.dart';
import 'package:vam_vam/data/model/response/user/postOfficeModel.dart';
import 'package:vam_vam/data/model/response/user/relationModel.dart';
import 'package:vam_vam/data/repo/registerRepo.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/user/assemblyModel.dart';
import '../data/model/response/user/blockModel.dart';
import '../data/model/response/user/cityModel.dart';
import '../data/model/response/user/districtModel.dart';
import '../data/model/response/user/panchayatWardModel.dart';
import '../data/model/response/user/parliamentryModel.dart';
import '../data/model/response/user/stateModel.dart';
import '../data/model/response/user/tehsilModel.dart';
import '../data/model/response/user/thanaModel.dart';
import '../data/model/response/user/townOrVillageModel.dart';
import '../data/model/response/user/userProfileModel.dart';
import '../utils/apiConstant.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepo registerRepo;

  RegisterProvider({required this.registerRepo});

  // Voter ID
  final TextEditingController _voterIdTextEditingController =
      TextEditingController();
  TextEditingController get voterIdTextEditingController =>
      _voterIdTextEditingController;

  // Aadhar No
  final TextEditingController _aadharNoTextEditingController =
      TextEditingController();
  TextEditingController get aadharNoTextEditingController =>
      _aadharNoTextEditingController;

  // Name
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  TextEditingController get nameTextEditingController =>
      _nameTextEditingController;

  // DOB
  final TextEditingController _dobTextEditingController =
      TextEditingController();
  TextEditingController get dobTextEditingController =>
      _dobTextEditingController;

  // Guardian Name
  final TextEditingController _guardianNameTextEditingController =
      TextEditingController();
  TextEditingController get guardianNameTextEditingController =>
      _guardianNameTextEditingController;

  // Mobile No
  final TextEditingController _mobileNoTextEditingController =
      TextEditingController();
  TextEditingController get mobileNoTextEditingController =>
      _mobileNoTextEditingController;

  // Ward No or Mohalla
  final TextEditingController _wardNoTextEditingController =
      TextEditingController();
  TextEditingController get wardNoTextEditingController =>
      _wardNoTextEditingController;

  // Street
  final TextEditingController _streetTextEditingController =
      TextEditingController();
  TextEditingController get streetTextEditingController =>
      _streetTextEditingController;

  // House No
  final TextEditingController _houseNoTextEditingController =
      TextEditingController();
  TextEditingController get houseNoTextEditingController =>
      _houseNoTextEditingController;

  // Landmark
  final TextEditingController _landmarkTextEditingController =
      TextEditingController();
  TextEditingController get landmarkTextEditingController =>
      _landmarkTextEditingController;

  // Pincode
  final TextEditingController _pinCodeTextEditingController =
      TextEditingController();
  TextEditingController get pinCodeTextEditingController =>
      _pinCodeTextEditingController;

  DateTime _dobInitialDate = DateTimeHelper().subtractYears(DateTime.now(), 18);
  // if 18
  DateTime get dobInitialDate => _dobInitialDate;

  // Age
  final TextEditingController _ageTextEditingController =
      TextEditingController();
  TextEditingController get ageTextEditingController =>
      _ageTextEditingController;

  // Email
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  TextEditingController get emailTextEditingController =>
      _emailTextEditingController;

  // Loader
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Relation
  final List<RelationModelData> _relationList = [];
  List<RelationModelData> get relationList => _relationList;

  String? _selectedRelation;
  String? get selectedReleation => _selectedRelation;

  // State
  final List<StateModelData> _stateList = [];
  List<StateModelData> get stateList => _stateList;

  String? _selectedState;
  String? get selectedState => _selectedState;

  // District
  final List<DistrictModelData> _districtList = [];
  List<DistrictModelData> get districtList => _districtList;

  String? _selectedDistrict;
  String? get selectedDistrict => _selectedDistrict;

  // Tehsil
  final List<TehsilModelData> _tehsilList = [];
  List<TehsilModelData> get tehsilList => _tehsilList;

  String? _selectedTehsil;
  String? get selectedTehsil => _selectedTehsil;

  // Block
  final List<BlockModelData> _blockList = [];
  List<BlockModelData> get blockList => _blockList;

  String? _selectedBlock;
  String? get selectedBlock => _selectedBlock;

  // Parliamentry
  final List<ParlimentaryModelData> _parliamentryList = [];
  List<ParlimentaryModelData> get parliamentryList => _parliamentryList;

  String? _selectedParliamentry;
  String? get selectedParliamentry => _selectedParliamentry;

  // Assembly
  final List<AssemblyModelData> _assemblyList = [];
  List<AssemblyModelData> get assemblyList => _assemblyList;

  String? _selectedAssembly;
  String? get selectedAssembly => _selectedAssembly;

  // City
  final List<CityModelData> _cityList = [];
  List<CityModelData> get cityList => _cityList;

  String? _selectedCity;
  String? get selectedCity => _selectedCity;

  // Municipality
  final List<MunicipalityModelData> _municipalityList = [];
  List<MunicipalityModelData> get municipalityList => _municipalityList;

  String? _selectedMunicipality;
  String? get selectedMunicipality => _selectedMunicipality;

  // Ward
  final List<WardModelData> _wardList = [];
  List<WardModelData> get wardList => _wardList;

  String? _selectedWard;
  String? get selectedWard => _selectedWard;

  // TOWN OR VILLAGE
  final List<TownOrVillageModelData> _townOrVillageList = [];
  List<TownOrVillageModelData> get townOrVillageList => _townOrVillageList;

  String? _selectedTownOrVillage;
  String? get selectedTownOrVillage => _selectedTownOrVillage;

  // Panchayat ward
  final List<PanchayatWardModelData> _panchayatWardList = [];
  List<PanchayatWardModelData> get panchayatWardList => _panchayatWardList;

  String? _selectedPanchayatWard;
  String? get selectedPanchayatWard => _selectedPanchayatWard;

  // Thana
  final List<ThanaModelData> _thanaList = [];
  List<ThanaModelData> get thanaList => _thanaList;

  String? _selectedThana;
  String? get selectedThana => _selectedThana;

  // Post office
  final List<PostOfficeModelData> _postOfficeList = [];
  List<PostOfficeModelData> get postOfficeList => _postOfficeList;

  String? _selectedPostOffice;
  String? get selectedPostOffice => _selectedPostOffice;

  // Gender
  String? _selectedGender;
  String? get selectedGender => _selectedGender;

  // Area
  List<String> areaList = ['Rural', 'Urban'];
  String? _selectedArea;
  String? get selectedArea => _selectedArea;

  setSelectedArea(String? value) {
    _selectedArea = value;
    notifyListeners();
  }

  setSelectedGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }

  setSelectedMunicipality(String? value, UserProfileModelData userProfileInfo) {
    _selectedMunicipality = value;
    notifyListeners();
    WardModelParams model = WardModelParams(
        districtId: getDistrictId('$_selectedDistrict'),
        municipalityId: getMunicipalityId('$_selectedMunicipality'),
        stateId: getStateId('$_selectedState'),
        tehsilId: getTehsilId('$_selectedTehsil'));
    getWard(model, userProfileInfo).then((v) {
      if (!v.isSuccess) {
        errorToast(msg: v.message);
      }
    });
  }

  setSelectedWard(String? value) {
    _selectedWard = value;
    notifyListeners();
  }

  setSelectedRelation(String? value) {
    _selectedRelation = value != '' ? value : null;
    notifyListeners();
  }

  setDOBTextEditingController(String value) {
    _dobTextEditingController.text = value;
    notifyListeners();
  }

  setSelectedCity(String? value) {
    _selectedCity = value;
    notifyListeners();
  }

  setDonInitialDate(DateTime date) {
    _dobInitialDate = date;
    notifyListeners();
  }

  setSelectedState(String? value, UserProfileModelData userProfileInfo,
      {String? isFirstTime}) {
    _selectedState = value;
    notifyListeners();
    clearTehsil();
    clearAssembly();
    clearBlock();
    clearCity();
    clearDistrict();
    _districtList.clear();
    _tehsilList.clear();
    _assemblyList.clear();
    _blockList.clear();
    cityList.clear();
    notifyListeners();
    getDistrict(getStateId('$value'), userProfileInfo, isFirstTime: isFirstTime)
        .then((v) {
      if (!v.isSuccess && isFirstTime == null) {
        errorToast(
          msg: v.message,
        );
      }
      getParliamentry(getStateId('$value'), userProfileInfo,
              isFirstTime: isFirstTime)
          .then((v1) {
        if (!v1.isSuccess && isFirstTime == null) {
          errorToast(msg: v1.message);
        }
      });
    });
  }

  setSelectedTehsil(String? value, UserProfileModelData userProfileModelData) {
    _selectedTehsil = value;
    notifyListeners();
    clearBlock();
    _blockList.clear();
    notifyListeners();
    getTownOrVillage(getTehsilId('$value'), userProfileModelData).then((v) {
      if (!v.isSuccess) {
        errorToast(
          msg: v.message,
        );
      }
    });
    getPanchayatWard(getTehsilId('$value'), userProfileModelData).then((v) {
      if (!v.isSuccess) {
        errorToast(
          msg: v.message,
        );
      }
    });
    getBlock(getTehsilId('$value'), userProfileModelData).then((v) {
      if (!v.isSuccess) {
        errorToast(
          msg: v.message,
        );
      }
    });
    getThana(getTehsilId('$value'), userProfileModelData).then((v) {
      if (!v.isSuccess) {
        errorToast(
          msg: v.message,
        );
      }
    });
    getPostOffice(getTehsilId('$value'), userProfileModelData).then((v) {
      if (!v.isSuccess) {
        errorToast(
          msg: v.message,
        );
      }
    });
  }

  setSelectedDistrict(String? value, UserProfileModelData userProfileInfo,
      {String? isFirstTime}) {
    _selectedDistrict = value;
    notifyListeners();
    clearTehsil();
    _tehsilList.clear();
    _assemblyList.clear();
    notifyListeners();
    getTehsil(getStateId('$_selectedState'), getDistrictId('$value'),
            userProfileInfo)
        .then((v) {
      if (isFirstTime == null) {
        if (!v.isSuccess) {
          errorToast(
            msg: v.message,
          );
        }
      }

      getAssembly(getStateId('$_selectedState'), getDistrictId('$value'),
              userProfileInfo)
          .then((v1) {
        if (!v1.isSuccess && isFirstTime == null) {
          errorToast(msg: v1.message);
        }
      });
    });
  }

  setSelectedAssembly(String? value) {
    _selectedAssembly = value;
    notifyListeners();
  }

  setSelectedBlock(String? value, UserProfileModelData userProfileInfo) {
    _selectedBlock = value;
    notifyListeners();
    // _cityList.clear();
    // clearCity();
    // getCity(
    //         getStateId('$_selectedState'),
    //         getDistrictId('$_selectedDistrict'),
    //         getBlockId('$value'),
    //         getTehsilId('$_selectedTehsil'),
    //         userProfileInfo)
    //     .then((v) {
    //   if (!v.isSuccess) {
    //     errorToast(
    //       msg: v.message,
    //     );
    //   }
    // });
  }

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setSelectedParliamentry(
    String? value,
  ) {
    _selectedParliamentry = value;
    notifyListeners();
  }

  setSelectedThana(String? value) {
    _selectedThana = value;
    notifyListeners();
  }

  setSelectedPostOffice(String? value) {
    _selectedPostOffice = value;
    notifyListeners();
  }

  setAge(String value) {
    _ageTextEditingController.text = value;
    notifyListeners();
  }

  setSelectedTownOrVillage(String? value) {
    _selectedTownOrVillage = value;
    notifyListeners();
  }

  setSelectedPanchayatWard(String? value) {
    _selectedPanchayatWard = value;
    notifyListeners();
  }

  String getStateId(String value) {
    String id = '';
    for (var element in _stateList) {
      if (element.name == value) {
        id = "${element.id}";
      }
    }
    return id;
  }

  String getDistrictId(String value) {
    String id = '';
    for (var element in _districtList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getMunicipalityId(String value) {
    String id = '';
    for (var element in _municipalityList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getWardId(String value) {
    String id = '';
    for (var element in _wardList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getTehsilId(String value) {
    String id = '';
    for (var element in _tehsilList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getBlockId(String value) {
    String id = '';
    for (var element in _blockList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getPanchayatWardId(String value) {
    String id = '';
    for (var element in _panchayatWardList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getPostOfficeId(String value) {
    String id = '';
    for (var element in _postOfficeList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getThanaId(String value) {
    String id = '';
    for (var element in _thanaList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getTownOrVillageId(String value) {
    String id = '';
    for (var element in _townOrVillageList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getParliamentryId(String value) {
    String id = '';
    for (var element in _parliamentryList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getAssemblyId(String value) {
    String id = '';
    for (var element in _assemblyList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  String getCityId(String value) {
    String id = '';
    for (var element in _cityList) {
      if (element.name == value) {
        id = '${element.id}';
      }
    }
    return id;
  }

  //----------------------------- Apis Section -----------------------------
  // Get Relation APi
  Future<ResponseModel> getRelation() async {
    _dispose();
    startLoader(true);
    clearRelation();
    _relationList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getRelation();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          RelationModelData model = RelationModelData.fromJson(item);
          _relationList.add(model);
          notifyListeners();
        });
        getState();
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

  // Get State Api
  Future<ResponseModel> getState() async {
    clearState();
    _stateList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getState();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          StateModelData model = StateModelData.fromJson(item);
          _stateList.add(model);
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

  // Get District Api
  Future<ResponseModel> getDistrict(
      String stateId, UserProfileModelData userProfileInfo,
      {String? isFirstTime}) async {
    startLoader(true);
    clearDistrict();
    _districtList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getDistrict(stateId: stateId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          DistrictModelData model = DistrictModelData.fromJson(item);
          _districtList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.districtName != null &&
            userProfileInfo.districtName!.isNotEmpty) {
          setSelectedDistrict(userProfileInfo.districtName, userProfileInfo,
              isFirstTime: isFirstTime);
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
    return responseModel;
  }

  // Get District Api
  Future<ResponseModel> getTehsil(String stateId, String districtId,
      UserProfileModelData userProfileInfo) async {
    startLoader(true);
    clearTehsil();
    _tehsilList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await registerRepo.getTehsil(stateId: stateId, districtId: districtId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          TehsilModelData model = TehsilModelData.fromJson(item);
          _tehsilList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.tehsilName != null &&
            userProfileInfo.tehsilName!.isNotEmpty) {
          setSelectedTehsil(userProfileInfo.tehsilName, userProfileInfo);
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
    // startLoader(false);
    return responseModel;
  }

  // Get Municipality Api
  Future<ResponseModel> getMunicipality(
      String tehsilId, UserProfileModelData userProfileInfo) async {
    startLoader(true);
    clearMunicipality();
    _municipalityList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await registerRepo.getMunicipality(tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          MunicipalityModelData model = MunicipalityModelData.fromJson(item);
          _municipalityList.add(model);
          notifyListeners();
        });
        // if (userProfileInfo.municipalityName != null &&
        //     userProfileInfo.municipalityName!.isNotEmpty) {
        //   setSelectedMunicipality(
        //       userProfileInfo.municipalityName, userProfileInfo);
        // }
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

  // Get Ward Api
  Future<ResponseModel> getWard(
      WardModelParams model, UserProfileModelData userProfileInfo) async {
    startLoader(true);
    clearWard();
    _wardList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getWard(model: model);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          WardModelData model = WardModelData.fromJson(item);
          _wardList.add(model);
          notifyListeners();
        });
        // if (userProfileInfo.wardName != null &&
        //     userProfileInfo.wardName!.isNotEmpty) {
        //   setSelectedWard(userProfileInfo.wardName);
        // }
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
    startLoader(false);
    notifyListeners();
    return responseModel;
  }

  // Get Gram Panchayat Api
  Future<ResponseModel> getBlock(
      String tehsilId, UserProfileModelData userProfileInfo) async {
    startLoader(true);
    clearBlock();
    _blockList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getBlock(tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          BlockModelData model = BlockModelData.fromJson(item);
          _blockList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.blockName != null &&
            userProfileInfo.blockName!.isNotEmpty) {
          setSelectedBlock(userProfileInfo.blockName, userProfileInfo);
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

  // Get Parliamentry Api
  Future<ResponseModel> getParliamentry(
      String stateId, UserProfileModelData userProfileInfo,
      {String? isFirstTime}) async {
    clearParliamentary();
    _parliamentryList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await registerRepo.getParliamentry(stateId: stateId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          ParlimentaryModelData model = ParlimentaryModelData.fromJson(item);
          _parliamentryList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.parliamentaryName != null &&
            userProfileInfo.parliamentaryName!.isNotEmpty) {
          setSelectedParliamentry(userProfileInfo.parliamentaryName);
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

  // Get Assembly Api
  Future<ResponseModel> getAssembly(String stateId, String districtId,
      UserProfileModelData userProfileInfo) async {
    clearAssembly();
    _assemblyList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getAssembly(
        districtId: districtId, stateId: stateId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          AssemblyModelData model = AssemblyModelData.fromJson(item);
          _assemblyList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.assemblyName != null &&
            userProfileInfo.assemblyName!.isNotEmpty) {
          setSelectedAssembly(userProfileInfo.assemblyName);
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

  // Get town or village Api
  Future<ResponseModel> getTownOrVillage(
      String tehsilId, UserProfileModelData userProfileInfo) async {
    clearTownVillage();
    _townOrVillageList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await registerRepo.getTownOrVillage(tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          TownOrVillageModelData model = TownOrVillageModelData.fromJson(item);
          _townOrVillageList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.townVillageName != null &&
            userProfileInfo.townVillageName!.isNotEmpty) {
          setSelectedTownOrVillage(userProfileInfo.townVillageName);
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

  // Get panchayat ward Api
  Future<ResponseModel> getPanchayatWard(
      String tehsilId, UserProfileModelData userProfileInfo) async {
    clearPanchayatWard();
    _panchayatWardList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await registerRepo.getPanchayatWard(tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          PanchayatWardModelData model = PanchayatWardModelData.fromJson(item);
          _panchayatWardList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.panchayatWardName != null &&
            userProfileInfo.panchayatWardName!.isNotEmpty) {
          setSelectedPanchayatWard(userProfileInfo.panchayatWardName);
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

  // Get thatn Api
  Future<ResponseModel> getThana(
      String tehsilId, UserProfileModelData userProfileInfo) async {
    clearThana();
    _thanaList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getThana(tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          ThanaModelData model = ThanaModelData.fromJson(item);
          _thanaList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.thanaName != null &&
            userProfileInfo.thanaName!.isNotEmpty) {
          setSelectedThana(userProfileInfo.thanaName);
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

  // Get postOfiive Api
  Future<ResponseModel> getPostOffice(
      String tehsilId, UserProfileModelData userProfileInfo) async {
    clearPostOffice();
    _postOfficeList.clear();
    notifyListeners();
    ApiResponse apiResponse =
        await registerRepo.getPostOffice(tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          PostOfficeModelData model = PostOfficeModelData.fromJson(item);
          _postOfficeList.add(model);
          notifyListeners();
        });
        if (userProfileInfo.postOfficeName != null &&
            userProfileInfo.postOfficeName!.isNotEmpty) {
          setSelectedPostOffice(userProfileInfo.postOfficeName);
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

  // Get City Api
  Future<ResponseModel> getCity(
      String stateId,
      String districtId,
      String blockId,
      String tehsilId,
      UserProfileModelData userProfileInfo) async {
    startLoader(true);
    clearCity();
    _cityList.clear();
    notifyListeners();
    ApiResponse apiResponse = await registerRepo.getCity(
        districtId: districtId,
        stateId: stateId,
        blockId: blockId,
        tehsilId: tehsilId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          CityModelData model = CityModelData.fromJson(item);
          _cityList.add(model);
          notifyListeners();
        });
        // if (userProfileInfo.cityName != null &&
        //     userProfileInfo.cityName!.isNotEmpty) {
        //   setSelectedCity(userProfileInfo.cityName);
        // }
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

  // Register Api
  Future<ResponseModel> register(
      RegisterModelParams registerModelParams) async {
    startLoader(true);
    ApiResponse apiResponse =
        await registerRepo.register(registerModelParams: registerModelParams);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message'].toString());
      } else {
        _dispose();
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

  //----------------------------- Setter Section -----------------------------
  setVoterId(String value) {
    _voterIdTextEditingController.text = value;
    _voterIdTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _voterIdTextEditingController.text.length),
    );
    notifyListeners();
  }

  setAadharNo(String value) {
    _aadharNoTextEditingController.text = value;
    _aadharNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _aadharNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  setName(String value) {
    _nameTextEditingController.text = value;
    _nameTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _nameTextEditingController.text.length),
    );
    notifyListeners();
  }

  setDob(String value) {
    if (value != '') {
      _dobTextEditingController.text = value;
      _dobTextEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _dobTextEditingController.text.length),
      );
      notifyListeners();
      setAge(DateTimeHelper.calculateAge(DateTime.parse(value)).toString());
    }
  }

  setGuardianName(String value) {
    _guardianNameTextEditingController.text = value;
    _guardianNameTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _guardianNameTextEditingController.text.length),
    );
    notifyListeners();
  }

  setMobileNo(String value) {
    _mobileNoTextEditingController.text = value;
    _mobileNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _mobileNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  setEmailId(String value) {
    _emailTextEditingController.text = value;
    _emailTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _emailTextEditingController.text.length),
    );
    notifyListeners();
  }

  setWardNo(String value) {
    _wardNoTextEditingController.text = value;
    _wardNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _wardNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  setStreet(String value) {
    _streetTextEditingController.text = value;
    _streetTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _streetTextEditingController.text.length),
    );
    notifyListeners();
  }

  setHouseNo(String value) {
    _houseNoTextEditingController.text = value;
    _houseNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _houseNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  setLandmark(String value) {
    _landmarkTextEditingController.text = value;
    _landmarkTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _landmarkTextEditingController.text.length),
    );
    notifyListeners();
  }

  setPinCode(String value) {
    _pinCodeTextEditingController.text = value;
    _pinCodeTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _pinCodeTextEditingController.text.length),
    );
    notifyListeners();
  }

  //----------------------------- Dispose Section -----------------------------
  _dispose() {
    clearVoterId();
    clearAadharNo();
    clearName();
    clearGender();
    clearDob();
    clearAge();
    clearGuardianName();
    clearMobile();
    clearEmail();
    notifyListeners();
    clearState();
    clearRelation();
    clearDistrict();
    clearArea();
    clearTehsil();
    clearBlock();
    clearParliamentary();
    clearAssembly();
    clearCity();
    clearWardNo();
    clearStreet();
    clearHouseNo();
    clearLandmark();
    clearPinCode();
    clearMunicipality();
    clearWard();
  }

  clearVoterId() {
    _voterIdTextEditingController.text = '';
    _voterIdTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _voterIdTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearAadharNo() {
    _aadharNoTextEditingController.text = '';
    _aadharNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _aadharNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearName() {
    _nameTextEditingController.text = '';
    _nameTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _nameTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearGender() {
    _selectedGender = null;
    notifyListeners();
  }

  clearDob() {
    _dobTextEditingController.text = '';
    _dobTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _dobTextEditingController.text.length),
    );
  }

  clearAge() {
    _ageTextEditingController.text = '';
    _ageTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _ageTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearGuardianName() {
    _guardianNameTextEditingController.text = '';
    _guardianNameTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _guardianNameTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearMobile() {
    _mobileNoTextEditingController.text = '';
    _mobileNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _mobileNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearEmail() {
    _emailTextEditingController.text = '';
    _emailTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _emailTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearWardNo() {
    _wardNoTextEditingController.text = '';
    _wardNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _wardNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearStreet() {
    _streetTextEditingController.text = '';
    _streetTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _streetTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearHouseNo() {
    _houseNoTextEditingController.text = '';
    _houseNoTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _houseNoTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearLandmark() {
    _landmarkTextEditingController.text = '';
    _landmarkTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _landmarkTextEditingController.text.length),
    );
    notifyListeners();
  }

  clearPinCode() {
    _pinCodeTextEditingController.text = '';
    _pinCodeTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _pinCodeTextEditingController.text.length),
    );
  }

  clearState() {
    _selectedState = null;
    notifyListeners();
  }

  clearRelation() {
    _selectedRelation = null;
    notifyListeners();
  }

  clearDistrict() {
    _selectedDistrict = null;
    notifyListeners();
  }

  clearArea() {
    _selectedArea = null;
    notifyListeners();
  }

  clearTehsil() {
    _selectedTehsil = null;
    notifyListeners();
  }

  clearBlock() {
    _selectedBlock = null;
    notifyListeners();
  }

  clearParliamentary() {
    _selectedParliamentry = null;
    notifyListeners();
  }

  clearAssembly() {
    _selectedAssembly = null;
    notifyListeners();
  }

  clearCity() {
    _selectedCity = null;
    notifyListeners();
  }

  clearMunicipality() {
    _selectedMunicipality = null;
    notifyListeners();
  }

  clearWard() {
    _selectedWard = null;
    notifyListeners();
  }

  clearTownVillage() {
    _selectedTownOrVillage = null;
    notifyListeners();
  }

  clearPanchayatWard() {
    _selectedPanchayatWard = null;
    notifyListeners();
  }

  clearThana() {
    _selectedThana = null;
    notifyListeners();
  }

  clearPostOffice() {
    _selectedPostOffice = null;
    notifyListeners();
  }
}
