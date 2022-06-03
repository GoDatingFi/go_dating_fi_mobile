class LanguageCollectionModel {
  String? odataContext;
  List<LanguageValue>? value;

  LanguageCollectionModel({this.odataContext, this.value});

  LanguageCollectionModel.fromJson(Map<String, dynamic> json) {
    odataContext = json['@odata.context'];
    if (json['value'] != null) {
      value = <LanguageValue>[];
      json['value'].forEach((v) {
        value!.add(LanguageValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@odata.context'] = this.odataContext;
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguageValue {
  String? id;
  String? code;
  String? name;
  bool? enable;
  String? icon;
  String? createdTime;
  Object? createdBy;
  String? modifiedTime;
  Object? modifiedBy;
  bool? isDeleted;
  Object? deletedBy;
  String? deletedTime;

  LanguageValue(
      {this.id,
      this.code,
      this.name,
      this.enable,
      this.icon,
      this.createdTime,
      this.createdBy,
      this.modifiedTime,
      this.modifiedBy,
      this.isDeleted,
      this.deletedBy,
      this.deletedTime});

  LanguageValue.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    code = json['Code'];
    name = json['Name'];
    enable = json['Enable'];
    icon = json['Icon'];
    createdTime = json['CreatedTime'];
    createdBy = json['CreatedBy'];
    modifiedTime = json['ModifiedTime'];
    modifiedBy = json['ModifiedBy'];
    isDeleted = json['IsDeleted'];
    deletedBy = json['DeletedBy'];
    deletedTime = json['DeletedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Code'] = this.code;
    data['Name'] = this.name;
    data['Enable'] = this.enable;
    data['Icon'] = this.icon;
    data['CreatedTime'] = this.createdTime;
    data['CreatedBy'] = this.createdBy;
    data['ModifiedTime'] = this.modifiedTime;
    data['ModifiedBy'] = this.modifiedBy;
    data['IsDeleted'] = this.isDeleted;
    data['DeletedBy'] = this.deletedBy;
    data['DeletedTime'] = this.deletedTime;
    return data;
  }
}
