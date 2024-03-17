class LoginModel {
  bool? status;
  String? msg;
  int? id;
  String? name;
  int? type;
  String? image;

  LoginModel({
    this.status,
    this.msg,
    this.id,
    this.name,
    this.type,
    this.image,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['image'] = image;
    return data;
  }
}
