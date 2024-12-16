import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/apiConstant.dart';

class DioClient1 {
  final String baseUrl;
  final SharedPreferences? sharedPreferences;

  late Dio dio;
  String token = '';
  String id = '';

  DioClient1(
    this.baseUrl,
    Dio dioC, {
    this.sharedPreferences,
  }) {
    if (sharedPreferences!.containsKey(ApiConstant.keyUserId)) {
      id = sharedPreferences!.getString(ApiConstant.keyUserId)!;
      debugPrint('USER_ID>> $id');
    }
    if (sharedPreferences!.containsKey(ApiConstant.keyToken)) {
      token = sharedPreferences!.getString(ApiConstant.keyToken)!;
      debugPrint("USER_TOKEN>> $token");
    }

    dio = dioC;
    dio
    ..options.connectTimeout = Duration(seconds: 10)
      ..options.receiveTimeout = Duration(seconds: 10)
      ..options.baseUrl = baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'id': id,
        'Authorization': "Bearer $token",
      };

  }

  Future<Response> get(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.baseUrl = ApiConstant.currentSchoolUrl;
    debugPrint('MAIN___BASE___URL>>>>> ${dio.options.baseUrl}');
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      print('===============${e.toString()}');
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.baseUrl = ApiConstant.currentSchoolUrl;
    debugPrint('MAIN___BASE___URL>>>>> ${dio.options.baseUrl}');

    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.baseUrl = ApiConstant.currentSchoolUrl;
    debugPrint('MAIN___BASE___URL>>>>> ${dio.options.baseUrl}');
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dio.options.baseUrl = ApiConstant.currentSchoolUrl;
    // debugPrint('MAIN___BASE___URL>>>>> $baseUrl');
    debugPrint('MAIN___BASE___URL>>>>> ${dio.options.baseUrl}');
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
