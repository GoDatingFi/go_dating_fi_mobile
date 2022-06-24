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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@odata.context'] = odataContext;
    if (value != null) {
      data['value'] = value!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Code'] = code;
    data['Name'] = name;
    data['Enable'] = enable;
    data['Icon'] = icon;
    data['CreatedTime'] = createdTime;
    data['CreatedBy'] = createdBy;
    data['ModifiedTime'] = modifiedTime;
    data['ModifiedBy'] = modifiedBy;
    data['IsDeleted'] = isDeleted;
    data['DeletedBy'] = deletedBy;
    data['DeletedTime'] = deletedTime;
    return data;
  }
}
