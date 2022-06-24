class UserDataModel {
  Data? data;
  bool? isArray;
  String? path;
  String? duration;
  String? method;

  UserDataModel(
      {this.data, this.isArray, this.path, this.duration, this.method});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    isArray = json['isArray'];
    path = json['path'];
    duration = json['duration'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['isArray'] = this.isArray;
    data['path'] = this.path;
    data['duration'] = this.duration;
    data['method'] = this.method;
    return data;
  }
}

class Data {
  String? token;
  String? tokenExpiresAt;
  String? refreshToken;
  String? refreshTokenExpiresAt;
  String? userId;
  String? username;

  Data(
      {this.token,
      this.tokenExpiresAt,
      this.refreshToken,
      this.refreshTokenExpiresAt,
      this.userId,
      this.username});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenExpiresAt = json['tokenExpiresAt'];
    refreshToken = json['refreshToken'];
    refreshTokenExpiresAt = json['refreshTokenExpiresAt'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['tokenExpiresAt'] = this.tokenExpiresAt;
    data['refreshToken'] = this.refreshToken;
    data['refreshTokenExpiresAt'] = this.refreshTokenExpiresAt;
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}
