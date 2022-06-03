import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ui/screens/widgets/utils/string.dart';

class AuthUtils {
  static AuthUtils instance = AuthUtils();

  static String? _token = "";

  static String? profileId = "";

  static String? primaryId = "";
  static String? _accessTokenExpiredTime = "";
  static String? _refreshTokenExpiredTime = "";
  static String? _refreshToken = "";
  static String? slideTime = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String? _tokenId;
  late String? _accessTokenExpiredTimeId;
  late String? _refreshTokenExpiredTimeId;
  late String? _refreshTokenId;
  late String? _primary;
  late String? _slideTimeId;
  late String? _profileId;

  Future getToken() async {
    if (_token != null && _token!.isNotEmpty) {
      return _token;
    } else {
      final SharedPreferences prefs = await _prefs;
      _tokenId = prefs.getString(StringApp.TOKEN_ID);
      if (_tokenId != null && _tokenId!.isNotEmpty) {
        _token = _tokenId;
      }
    }
    return _token;
  }

  Future getAccessTokenExpiredTime() async {
    if (_accessTokenExpiredTime != null &&
        _accessTokenExpiredTime!.isNotEmpty) {
      return _accessTokenExpiredTime;
    } else {
      final SharedPreferences prefs = await _prefs;
      _accessTokenExpiredTimeId =
          prefs.getString(StringApp.ACCESS_TOKEN_EXPIRED_TIME_ID);
      if (_accessTokenExpiredTimeId != null &&
          _accessTokenExpiredTimeId!.isNotEmpty) {
        _accessTokenExpiredTime = _accessTokenExpiredTimeId;
      }
    }
    return _accessTokenExpiredTime;
  }

  Future getRefreshTokenExpiredTime() async {
    if (_refreshTokenExpiredTime != null &&
        _refreshTokenExpiredTime!.isNotEmpty) {
      return _refreshTokenExpiredTime;
    } else {
      final SharedPreferences prefs = await _prefs;
      _refreshTokenExpiredTimeId =
          prefs.getString(StringApp.REFRESH_TOKEN_EXPIRED_TIME_ID);
      if (_refreshTokenExpiredTimeId != null &&
          _refreshTokenExpiredTimeId!.isNotEmpty) {
        _refreshTokenExpiredTime = _refreshTokenExpiredTimeId;
      }
    }
    return _refreshTokenExpiredTime;
  }

  Future getRefreshToken() async {
    if (_refreshToken != null && _refreshToken!.isNotEmpty) {
      return _refreshToken;
    } else {
      final SharedPreferences prefs = await _prefs;
      _refreshTokenId =
          prefs.getString(StringApp.REFRESH_TOKEN_EXPIRED_TIME_ID);
      if (_refreshTokenId != null && _refreshTokenId!.isNotEmpty) {
        _refreshToken = _refreshTokenId;
      }
    }
    return _refreshTokenId;
  }

  Future<String?> getProfileId() async {
    if (profileId!.isEmpty) {
      final SharedPreferences prefs = await _prefs;
      _profileId = prefs.getString(StringApp.PROFILE_ID);
      if (_profileId != null && _profileId!.isNotEmpty) {
        profileId = _profileId;
      }
      return profileId;
    }

    return profileId;
  }

  Future<String?> getPrimaryId() async {
    if (primaryId != null && primaryId!.isNotEmpty) {
      return primaryId;
    } else {
      final SharedPreferences prefs = await _prefs;
      _primary = prefs.getString(StringApp.PROFILE_PRIMARY_ID);
      if (_primary != null && _primary!.isNotEmpty) {
        primaryId = _primary;
      }
    }
    Logger().d("$primaryId");

    return primaryId;
  }

  Future<String?> getSlideTime() async {
    if (slideTime != null && slideTime!.isNotEmpty) {
      return slideTime;
    } else {
      final SharedPreferences prefs = await _prefs;
      _slideTimeId = prefs.getString(StringApp.SLIDE_TIME_ID);
      if (_slideTimeId != null && _slideTimeId!.isNotEmpty) {
        slideTime = _slideTimeId;
      }
    }
    return slideTime;
  }

  void setProfileId(String _profileId) {
    profileId = _profileId;
  }

  void setAccessTokenExpiredTime(String accessTokenExpiredTime) {
    _accessTokenExpiredTime = accessTokenExpiredTime;
  }

  void setRefreshTokenExpiredTime(String refreshTokenExpiredTime) {
    _refreshTokenExpiredTime = refreshTokenExpiredTime;
  }

  void setRefreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  void setPrimaryId(String _primaryId) {
    primaryId = _primaryId;
  }

  void setToken(String token) {
    _token = token;
  }

  void setSlideTime(String time) {
    slideTime = time;
  }
}
