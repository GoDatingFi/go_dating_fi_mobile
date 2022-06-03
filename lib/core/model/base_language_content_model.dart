class BaseLanguageContentModel {
  String? odataContext;
  List<Value>? value;

  BaseLanguageContentModel({this.odataContext, this.value});

  BaseLanguageContentModel.fromJson(Map<String, dynamic> json) {
    odataContext = json['@odata.context'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
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

class Value {
  String? context;
  String? key;
  String? value;

  Value({this.context, this.key, this.value});

  Value.fromJson(Map<String, dynamic> json) {
    context = json['Context'];
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Context'] = this.context;
    data['Key'] = this.key;
    data['Value'] = this.value;
    return data;
  }
}
