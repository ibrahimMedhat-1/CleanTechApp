class SalaryDetailsModel {
  double? totalSalary;
  double? totalCommissions;
  double? totalDeductions;
  List<Commissions>? commissions;
  List<Commissions>? deductions;

  SalaryDetailsModel(
      {this.totalSalary,
        this.totalCommissions,
        this.totalDeductions,
        this.commissions,
        this.deductions});

  SalaryDetailsModel.fromJson(Map<String, dynamic> json) {
    totalSalary = json['total_salary'];
    totalCommissions = json['total_commissions'];
    totalDeductions = json['total_deductions'];
    if (json['commissions'] != null) {
      commissions = <Commissions>[];
      json['commissions'].forEach((v) {
        commissions!.add(new Commissions.fromJson(v));
      });
    }
    if (json['deductions'] != null) {
      deductions = <Commissions>[];
      json['deductions'].forEach((v) {
        deductions!.add(new Commissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_salary'] = this.totalSalary;
    data['total_commissions'] = this.totalCommissions;
    data['total_deductions'] = this.totalDeductions;
    if (this.commissions != null) {
      data['commissions'] = this.commissions!.map((v) => v.toJson()).toList();
    }
    if (this.deductions != null) {
      data['deductions'] = this.deductions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commissions {
  double? amount;
  String? description;
  String? date;

  Commissions({this.amount, this.description, this.date});

  Commissions.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }
}
