class CheckContainerModel {
  bool? exist;

  CheckContainerModel({this.exist});

  CheckContainerModel.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exist'] = exist;
    return data;
  }
}
