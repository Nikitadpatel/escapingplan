class ViewModel {
  String? status;
  String? message;
  Data? data;

  ViewModel({this.status, this.message, this.data});

  ViewModel.fromJson(Map<String, dynamic> json) {
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
  String? uId;
  String? username;
  String? password;
  Null? stripeCustId;
  String? email;
  String? type;
  String? freeCreated;
  String? isActive;
  String? createdDate;
  String? id;
  String? userId;
  String? fullname;
  String? gender;
  String? profileImg;
  String? phoneno;
  String? user;
  String? address;
  String? expertise;
  String? dateOfBirth;
  String? emergencyContact;
  String? additionalTraveller;
  String? updatedDate;

  Data(
      {this.uId,
        this.username,
        this.password,
        this.stripeCustId,
        this.email,
        this.type,
        this.freeCreated,
        this.isActive,
        this.createdDate,
        this.id,
        this.userId,
        this.fullname,
        this.gender,
        this.profileImg,
        this.phoneno,
        this.user,
        this.address,
        this.expertise,
        this.dateOfBirth,
        this.emergencyContact,
        this.additionalTraveller,
        this.updatedDate});

  Data.fromJson(Map<String, dynamic> json) {
    uId = json['u_id'];
    username = json['username'];
    password = json['password'];
    stripeCustId = json['stripe_cust_id'];
    email = json['email'];
    type = json['type'];
    freeCreated = json['free_created'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    id = json['id'];
    userId = json['user_id'];
    fullname = json['fullname'];
    gender = json['gender'];
    profileImg = json['profile_img'];
    phoneno = json['phoneno'];
    user = json['user'];
    address = json['address'];
    expertise = json['expertise'];
    dateOfBirth = json['date_of_birth'];
    emergencyContact = json['emergency_contact'];
    additionalTraveller = json['additional_traveller'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['u_id'] = this.uId;
    data['username'] = this.username;
    data['password'] = this.password;
    data['stripe_cust_id'] = this.stripeCustId;
    data['email'] = this.email;
    data['type'] = this.type;
    data['free_created'] = this.freeCreated;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['fullname'] = this.fullname;
    data['gender'] = this.gender;
    data['profile_img'] = this.profileImg;
    data['phoneno'] = this.phoneno;
    data['user'] = this.user;
    data['address'] = this.address;
    data['expertise'] = this.expertise;
    data['date_of_birth'] = this.dateOfBirth;
    data['emergency_contact'] = this.emergencyContact;
    data['additional_traveller'] = this.additionalTraveller;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}