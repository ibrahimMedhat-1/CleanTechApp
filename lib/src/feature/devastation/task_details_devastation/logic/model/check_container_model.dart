class CheckContainerModel {
  bool? exist;
  bool? available;
  CheckContainerModel({this.exist, this.available});

  CheckContainerModel.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exist'] = exist;
    data['available'] = available;
    return data;
  }
}
