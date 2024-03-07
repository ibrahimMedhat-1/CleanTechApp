class ChangeMissionStateModel {
  int? status;
  int? next;
  String? msg;

  ChangeMissionStateModel({this.status, this.next, this.msg});

  ChangeMissionStateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    next = json['next'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['next'] = this.next;
    data['msg'] = this.msg;
    return data;
  }
}
