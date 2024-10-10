import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

enum Method {
  get,
  put,
  post,
  delete,
}

class ApiService {
  const ApiService({required this.dio});

  final Dio dio;

  Future<bool> checkConnection() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity.contains(ConnectivityResult.mobile) || connectivity.contains(ConnectivityResult.wifi)) return true;
    return false;
  }

  Future<Map<String, Object?>> request(
      String path, {
        Method method = Method.get,
        bool setToken = false,
        Object? data,
        Map<String, Object?>? headers,
        Map<String, Object?>? queryParams,
        FormData? formData,
      }) async {
    if (!await checkConnection()) throw Exception('Not working internet');

    try {
      final requestHeaders = {
        ...?headers,
        'content-Type': formData != null ? 'multipart/form-data' : 'application/json',
      };

      final requestQueryParams = {
        ...?queryParams,
      };

      final response = await dio.request<Map<String, Object?>>(path,
          data: data ?? formData,
          queryParameters: requestQueryParams,
          options: Options(
            method: method.name,
            headers: requestHeaders,
          ));

      if (response.statusCode == null || response.statusCode! > 204 || response.data == null) {
        throw Exception('API Error');
      }

      return response.data ?? <String, Object?>{};
    } on Object catch (e, _) {
      rethrow;
    }
  }
}