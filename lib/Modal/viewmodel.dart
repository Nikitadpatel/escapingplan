class ViewModel {
  int? status;
  Data? data;

  ViewModel({this.status, this.data});

  ViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? fullName;
  String? emailAddress;
  String? dateOfBirth;
  Null? phoneNumber;
  String? gender;
  String? address;

  Data(
      {this.id,
      this.fullName,
      this.emailAddress,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['FullName'];
    emailAddress = json['Email Address'];
    dateOfBirth = json['Date of birth'];
    phoneNumber = json['Phone number'];
    gender = json['Gender'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['FullName'] = this.fullName;
    data['Email Address'] = this.emailAddress;
    data['Date of birth'] = this.dateOfBirth;
    data['Phone number'] = this.phoneNumber;
    data['Gender'] = this.gender;
    data['Address'] = this.address;
    return data;
  }
}
