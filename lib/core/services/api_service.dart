import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/constants.dart';

class ApiService {
  final _baseUrl = AppConstants.kBaseUrl;

  void requestInfo({
    required String method,
    required String endPoint,
    required dynamic body,
    required String? token,
    Map<String, String>? headers,
  }) {
    log('''
----------------------------
Method: $method
Url: $_baseUrl/$endPoint
Body: $body
Token: $token
Headers: $headers
''');
  }

  final Dio dio;
  ApiService(this.dio);

  Future<dynamic> get({
    required String endPoint,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    headers.addAll({'Accept': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    requestInfo(
      method: 'GET',
      endPoint: endPoint,
      body: body,
      token: token,
      headers: headers,
    );

    var response = await dio.get(
      '$_baseUrl/$endPoint',
      options: Options(headers: headers),
    );
    log('''
========================================
    Response : ${response.data}
========================================
    ''');
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    // headers.addAll({'Content-Type': 'application/json'});
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    headers.addAll({'Accept': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    requestInfo(
      method: 'POST',
      endPoint: endPoint,
      body: body,
      token: token,
      headers: headers,
    );

    var response = await dio.post(
      '$_baseUrl/$endPoint',
      data: body,
      options: Options(headers: headers),
    );

    log('''
========================================
    Response : ${response.data}
========================================
    ''');

    return response.data;
  }

  Future<dynamic> put({
    required String endPoint,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    headers.addAll({'Content-Type': 'application/json'});
    headers.addAll({'Accept': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    requestInfo(
      method: 'PUT',
      endPoint: endPoint,
      body: body,
      token: token,
      headers: headers,
    );

    var response = await dio.put(
      '$_baseUrl/$endPoint',
      data: body,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> delete({
    required String endPoint,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    requestInfo(
      method: 'DELETE',
      endPoint: endPoint,
      body: {},
      token: token,
      headers: headers,
    );

    var response = await dio.delete(
      '$_baseUrl/$endPoint',
      options: Options(headers: headers),
    );

    return response.data;
  }
}
