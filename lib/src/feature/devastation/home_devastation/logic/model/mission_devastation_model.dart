class MissionDevastationModel {
  int? id;
  int? missionType;
  int? companyType;
  String? company;
  String? address;
  String? description;
  double? latitude;
  double? longitude;
  String? date;
  String? time;
  int? currentStatus;
  String? image;
  double? amount;
  int? warehouse;

  MissionDevastationModel(
      {this.id,
      this.missionType,
      this.companyType,
      this.company,
      this.address,
      this.description,
      this.latitude,
      this.longitude,
      this.date,
      this.time,
      this.currentStatus,
      this.image,
      this.warehouse,
      this.amount});

  MissionDevastationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    missionType = json['mission_type'];
    companyType = json['company_type'];
    company = json['company'];
    address = json['address'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    date = json['date'];
    time = json['time'];
    currentStatus = json['current_status'];
    image = json['image'];
    amount = json['amount'];
    warehouse = json['warehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mission_type'] = missionType;
    data['company_type'] = companyType;
    data['company'] = company;
    data['address'] = address;
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['date'] = date;
    data['time'] = time;
    data['current_status'] = currentStatus;
    data['image'] = image;
    data['amount'] = amount;
    data['warehouse'] = warehouse;
    return data;
  }
}
