class ContactsModel {
  String? phone;
  String? whatsapp;

  ContactsModel({this.phone, this.whatsapp});

  ContactsModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}
