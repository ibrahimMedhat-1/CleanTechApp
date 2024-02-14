class MissionModel {
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

  MissionModel(
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
        this.currentStatus});

  MissionModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mission_type'] = this.missionType;
    data['company_type'] = this.companyType;
    data['company'] = this.company;
    data['address'] = this.address;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['date'] = this.date;
    data['time'] = this.time;
    data['current_status'] = this.currentStatus;
    return data;
  }
}
