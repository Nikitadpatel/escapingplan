class TripModel {
  int? status;
  String? message;
  List<Data>? data;

  TripModel({this.status, this.message, this.data});

  TripModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  List<String>? galleryImage;
  String? itineraryId;
  String? favourite;

  Data({this.title, this.galleryImage, this.itineraryId, this.favourite});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    galleryImage = json['gallery_image'].cast<String>();
    itineraryId = json['itinerary_id'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['gallery_image'] = this.galleryImage;
    data['itinerary_id'] = this.itineraryId;
    data['favourite'] = this.favourite;
    return data;
  }
}