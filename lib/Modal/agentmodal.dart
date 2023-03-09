class MyagentModal {
  int? status;
  String? message;
  Data? data;

  MyagentModal({this.status, this.message, this.data});

  MyagentModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? fullname;
  String? emailAddress;
  String? dateOfBirth;
  String? phoneNumber;
  String? gender;
  String? address;

  Data(
      {this.id,
      this.fullname,
      this.emailAddress,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['Fullname'];
    emailAddress = json['Email Address'];
    dateOfBirth = json['Date of birth'];
    phoneNumber = json['Phone number'];
    gender = json['Gender'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Fullname'] = this.fullname;
    data['Email Address'] = this.emailAddress;
    data['Date of birth'] = this.dateOfBirth;
    data['Phone number'] = this.phoneNumber;
    data['Gender'] = this.gender;
    data['Address'] = this.address;
    return data;
  }
}
