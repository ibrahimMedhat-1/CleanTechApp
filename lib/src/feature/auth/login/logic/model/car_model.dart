class CarModel {
  int? id;
  String? plate;

  CarModel({this.id, this.plate});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plate = json['plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plate'] = plate;
    return data;
  }
}
