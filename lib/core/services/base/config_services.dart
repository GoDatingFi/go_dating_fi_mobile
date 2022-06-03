import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ConfigServices {
  static Options getHeaders(
      {String token = "", String profileId = "", String primaryId = ""}) {
    var _headers = Map<String, dynamic>();
    _headers['Accept'] = "application/json";
    if (token != '') {
      _headers['Authorization'] = "Bearer " + token;
    }
    if (profileId != '') {
      _headers['ProfileId'] = profileId;
      _headers['friendId'] = profileId;
      _headers['ProfileIdAdministrator'] = profileId;
      _headers['profileIdOwner'] = profileId;
      _headers['profileIdSendFriendRequest'] = profileId;
    }
    if (primaryId != '') {
      _headers['ProfileId'] = primaryId;
      _headers['friendId'] = primaryId;
      _headers['ProfileIdAdministrator'] = primaryId;
      _headers['profileIdOwner'] = primaryId;
      _headers['profileIdSendFriendRequest'] = primaryId;
    }
    return Options(headers: _headers);
  }
}
