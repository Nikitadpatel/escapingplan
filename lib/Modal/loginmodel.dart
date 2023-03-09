class UserModal {
  int? status;
  String? message;
  Data? data;

  UserModal({this.status, this.message, this.data});

  UserModal.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
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
  String? email;
  String? fullname;
  String? type;
  String? itineraryId;
  String? clientId;
  String? clientName;
  String? profileImg;

  Data(
      {this.uId,
      this.email,
      this.fullname,
      this.type,
      this.itineraryId,
      this.clientId,
      this.clientName,
      this.profileImg});

  Data.fromJson(Map<dynamic, dynamic> json) {
    uId = json['u_id'];
    email = json['email'];
    fullname = json['fullname'];
    type = json['type'];
    itineraryId = json['itinerary_id'];
    clientId = json['client_id'];
    clientName = json['client_name'];
    profileImg = json['profile_img'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['u_id'] = this.uId;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['type'] = this.type;
    data['itinerary_id'] = this.itineraryId;
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['profile_img'] = this.profileImg;
    return data;
  }
}
