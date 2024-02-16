class OldMissionModel {
  int? totalMissions;
  int? completedMissions;
  int? percentage;
  List<Missions>? missions;

  OldMissionModel(
      {this.totalMissions,
        this.completedMissions,
        this.percentage,
        this.missions});

  OldMissionModel.fromJson(Map<String, dynamic> json) {
    totalMissions = json['total_missions'];
    completedMissions = json['completed_missions'];
    percentage = json['percentage'];
    if (json['missions'] != null) {
      missions = <Missions>[];
      json['missions'].forEach((v) {
        missions!.add(new Missions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_missions'] = this.totalMissions;
    data['completed_missions'] = this.completedMissions;
    data['percentage'] = this.percentage;
    if (this.missions != null) {
      data['missions'] = this.missions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Missions {
  int? companyType;
  int? status;
  String? company;
  String? address;
  String? date;
  String? time;

  Missions(
      {this.companyType,
        this.status,
        this.company,
        this.address,
        this.date,
        this.time});

  Missions.fromJson(Map<String, dynamic> json) {
    companyType = json['company_type'];
    status = json['status'];
    company = json['company'];
    address = json['address'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_type'] = this.companyType;
    data['status'] = this.status;
    data['company'] = this.company;
    data['address'] = this.address;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
