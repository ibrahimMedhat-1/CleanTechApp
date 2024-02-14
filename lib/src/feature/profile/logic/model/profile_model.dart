class ProfileModel {
  bool? status;
  String? msg;
  int? id;
  String? name;
  String? image;
  String? mobile;
  String? car;
  int? missionsToday;
  int? missionsMonth;
  int? missionsPassedToday;
  int? missionsPassedMonth;
  int? missionsPerToday;
  int? missionsPerMonth;

  ProfileModel(
      {this.status,
        this.msg,
        this.id,
        this.name,
        this.image,
        this.mobile,
        this.car,
        this.missionsToday,
        this.missionsMonth,
        this.missionsPassedToday,
        this.missionsPassedMonth,
        this.missionsPerToday,
        this.missionsPerMonth});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    mobile = json['mobile'];
    car = json['car'];
    missionsToday = json['missions_today'];
    missionsMonth = json['missions_month'];
    missionsPassedToday = json['missions_passed_today'];
    missionsPassedMonth = json['missions_passed_month'];
    missionsPerToday = json['missions_per_today'];
    missionsPerMonth = json['missions_per_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['mobile'] = this.mobile;
    data['car'] = this.car;
    data['missions_today'] = this.missionsToday;
    data['missions_month'] = this.missionsMonth;
    data['missions_passed_today'] = this.missionsPassedToday;
    data['missions_passed_month'] = this.missionsPassedMonth;
    data['missions_per_today'] = this.missionsPerToday;
    data['missions_per_month'] = this.missionsPerMonth;
    return data;
  }
}
