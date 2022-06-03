import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../utils/auth_utils.dart';
import 'config_services.dart';

enum RequestType { GET, POST, DELETE, PUT }

class BaseServices {
  final Dio _dio = Dio();
  Options? _headersOption;

  Future _getToken({bool? useProfileId, bool? primaryId = false}) async {
    var _token = await AuthUtils.instance.getToken();

    if (useProfileId != null && useProfileId) {
      if (primaryId != null && primaryId) {
        var _profileID = await AuthUtils.instance.getProfileId();
        var _primaryId = await AuthUtils.instance.getPrimaryId();

        _headersOption = ConfigServices.getHeaders(
            token: _token, profileId: _profileID!, primaryId: _primaryId!);
      } else {
        var _profileID = await AuthUtils.instance.getProfileId();
        _headersOption =
            ConfigServices.getHeaders(token: _token, profileId: _profileID!);
      }
    } else if (primaryId != null && primaryId) {
      var _primaryId = await AuthUtils.instance.getPrimaryId();

      _headersOption =
          ConfigServices.getHeaders(token: _token, primaryId: _primaryId!);
    } else {
      _headersOption = ConfigServices.getHeaders(token: _token);
    }
  }

  bool _isTokenRefresh = false;

  Future<dynamic> request(String url, RequestType type, BuildContext context,
      {dynamic data,
      bool? useToken,
      bool? useProfileId,
      bool? usePrimaryId}) async {
    var response;

    //If this route use token then fetch token
    if (useToken != null && useToken) {
      if (useProfileId != null && useProfileId) {
        if (usePrimaryId != null && usePrimaryId) {
          await _getToken(useProfileId: useProfileId, primaryId: true);
        } else {
          await _getToken(useProfileId: useProfileId);
        }
      } else if (usePrimaryId != null && usePrimaryId) {
        await _getToken(primaryId: true);
      } else {
        await _getToken();
      }
    } else {
      _headersOption = ConfigServices.getHeaders();
    }
    try {
      switch (type) {
        case RequestType.POST:
          response = await _dio.post(url, data: data, options: _headersOption);
          break;
        case RequestType.GET:
          response = await _dio.get(url, options: _headersOption);
          break;
        case RequestType.DELETE:
          response =
              await _dio.delete(url, data: data, options: _headersOption);
          break;
        case RequestType.PUT:
          response = await _dio.put(url, data: data, options: _headersOption);
          break;
      }
    } on DioError catch (e) {
      Logger().e(e.toString());
      response = e.response;
      if (_isTokenRefresh) {
        return;
      }
    }
    //* handling error and status code
    var resData;
    try {
      resData = json.decode(response.data);
    } catch (e) {
      // Logger().e(e.toString());
      resData = response.data;
    }

    return resData;
  }
}
