class Partnersmodal {
  int? status;
  String? message;
  List<Data>? data;

  Partnersmodal({this.status, this.message, this.data});

  Partnersmodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? partnerName;
  String? partnerImage;
  String? partnerLink;

  Data({this.partnerName, this.partnerImage, this.partnerLink});

  Data.fromJson(Map<String, dynamic> json) {
    partnerName = json['partner_name'];
    partnerImage = json['partner_image'];
    partnerLink = json['partner_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partner_name'] = this.partnerName;
    data['partner_image'] = this.partnerImage;
    data['partner_link'] = this.partnerLink;
    return data;
  }
}
