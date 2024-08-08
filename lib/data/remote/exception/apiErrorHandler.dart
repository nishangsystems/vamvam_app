// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/base/errorResponse.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.connectionError:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioErrorType.badResponse:
              switch (error.response?.statusCode) {
                case 429:
                case 405:
                case 404:
                case 500:
                case 503:
                case 400:
                  print('Status Message');
                  print(error.response!.data);
                  if (error.response!.data is String) {
                    errorDescription = error.response?.statusMessage;
                  } else if (error.response != null &&
                      '${error.response!.data['message']}' != null) {
                    errorDescription = error.response!.data['message'];
                  } else {
                    errorDescription = error.response?.statusMessage;
                  }

                  break;
                default:
                  ErrorResponse? errorResponse;
                  try {
                    errorResponse =
                        ErrorResponse.fromJson(error.response?.data);
                  } catch (e) {
                    debugPrint('$e');
                  }
                  if (errorResponse!.errors.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription =
                        "Failed to load data - status code: ${error.response?.statusCode}";
                  }
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            default:
              errorDescription = "Something went wrong!";
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
