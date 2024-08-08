import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/registerModelParams.dart';
import 'package:vam_vam/data/model/params/wardModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class RegisterRepo {
  final DioClient dioClient;
  final SharedPreferences prefs;

  RegisterRepo({required this.dioClient, required this.prefs});

  Future<ApiResponse> getRelation() async {
    try {
      Response response = await dioClient.get(
        ApiConstant.getReleation,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getState() async {
    try {
      Response response = await dioClient.get(
        ApiConstant.getState,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getDistrict({required String stateId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getDistrict, data: {'state_id': stateId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTehsil(
      {required String stateId, required String districtId}) async {
    try {
      Response response = await dioClient.post(ApiConstant.getTehsil,
          data: {'state_id': stateId, 'district_id': districtId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getBlock({required String tehsilId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getBlock, data: {'tehsil_id': tehsilId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getMunicipality({required String tehsilId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getMunicipality, data: {'tehsil_id': tehsilId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getWard({required WardModelParams model}) async {
    try {
      Response response =
          await dioClient.post(ApiConstant.getWard, data: model.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getParliamentry({required String stateId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getParliamentry, data: {'state_id': stateId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAssembly(
      {required String stateId, required String districtId}) async {
    try {
      Response response = await dioClient.post(ApiConstant.getAssembly,
          data: {'state_id': stateId, 'district_id': districtId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCity(
      {required String stateId,
      required String districtId,
      required String tehsilId,
      required String blockId}) async {
    try {
      Response response = await dioClient.post(ApiConstant.getCity, data: {
        'state_id': stateId,
        'district_id': districtId,
        'tehsil_id': tehsilId,
        'block_id': blockId
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> register(
      {required RegisterModelParams registerModelParams}) async {
    try {
      Response response = await dioClient.post(ApiConstant.register,
          data: registerModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTownOrVillage({required String tehsilId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getTownOrVillage, data: {'tehsil_id': tehsilId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getPanchayatWard({required String tehsilId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getPanchayatWard, data: {'tehsil_id': tehsilId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getThana({required String tehsilId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getThana, data: {'tehsil_id': tehsilId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getPostOffice({required String tehsilId}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.getPostOffice, data: {'tehsil_id': tehsilId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
