class NonceDataModel {
  int? data;
  bool? isArray;
  String? path;
  String? duration;
  String? method;

  NonceDataModel(
      {this.data, this.isArray, this.path, this.duration, this.method});

  NonceDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    isArray = json['isArray'];
    path = json['path'];
    duration = json['duration'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['isArray'] = this.isArray;
    data['path'] = this.path;
    data['duration'] = this.duration;
    data['method'] = this.method;
    return data;
  }
}