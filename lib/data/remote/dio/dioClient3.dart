import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/apiConstant.dart';
import 'loggingInterceptor.dart';

class DioClient3 {
  final String baseUrl;
  final LoggingInterceptor? loggingInterceptor;
  final SharedPreferences? sharedPreferences;

  late Dio dio;
  String token = '';
  String id = '';

  DioClient3(
      this.baseUrl,
      Dio dioC, {
        this.loggingInterceptor,
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
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(milliseconds: 30000)
      ..options.receiveTimeout = Duration(milliseconds: 30000)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
    dio.interceptors.add(loggingInterceptor!);
  }

  Future<Response> get(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    debugPrint('SCHOOL___BASE___URL>>>>> $baseUrl');
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

}
