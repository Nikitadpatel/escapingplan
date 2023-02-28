class DetailModel {
  int? status;
  String? message;
  List<AboutTheTour>? aboutTheTour;
  List<TourInformation>? tourInformation;
  List<TravelDetail>? travelDetail;
  List<Transport>? transport;
  List<Hotel>? hotel;
  List<String>? gallery;
  List<Itinerary>? itinerary;
  OtherInformation? otherInformation;

  DetailModel(
      {this.status,
        this.message,
        this.aboutTheTour,
        this.tourInformation,
        this.travelDetail,
        this.transport,
        this.hotel,
        this.gallery,
        this.itinerary,
        this.otherInformation});

  DetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['About the tour'] != null) {
      aboutTheTour = <AboutTheTour>[];
      json['About the tour'].forEach((v) {
        aboutTheTour!.add(new AboutTheTour.fromJson(v));
      });
    }
    if (json['Tour information'] != null) {
      tourInformation = <TourInformation>[];
      json['Tour information'].forEach((v) {
        tourInformation!.add(new TourInformation.fromJson(v));
      });
    }
    if (json['Travel Detail'] != null) {
      travelDetail = <TravelDetail>[];
      json['Travel Detail'].forEach((v) {
        travelDetail!.add(new TravelDetail.fromJson(v));
      });
    }
    if (json['Transport'] != null) {
      transport = <Transport>[];
      json['Transport'].forEach((v) {
        transport!.add(new Transport.fromJson(v));
      });
    }
    if (json['Hotel'] != null) {
      hotel = <Hotel>[];
      json['Hotel'].forEach((v) {
        hotel!.add(new Hotel.fromJson(v));
      });
    }
    gallery = json['Gallery'].cast<String>();
    if (json['Itinerary'] != null) {
      itinerary = <Itinerary>[];
      json['Itinerary'].forEach((v) {
        itinerary!.add(new Itinerary.fromJson(v));
      });
    }
    otherInformation = json['Other information'] != null
        ? new OtherInformation.fromJson(json['Other information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.aboutTheTour != null) {
      data['About the tour'] =
          this.aboutTheTour!.map((v) => v.toJson()).toList();
    }
    if (this.tourInformation != null) {
      data['Tour information'] =
          this.tourInformation!.map((v) => v.toJson()).toList();
    }
    if (this.travelDetail != null) {
      data['Travel Detail'] =
          this.travelDetail!.map((v) => v.toJson()).toList();
    }
    if (this.transport != null) {
      data['Transport'] = this.transport!.map((v) => v.toJson()).toList();
    }
    if (this.hotel != null) {
      data['Hotel'] = this.hotel!.map((v) => v.toJson()).toList();
    }
    data['Gallery'] = this.gallery;
    if (this.itinerary != null) {
      data['Itinerary'] = this.itinerary!.map((v) => v.toJson()).toList();
    }
    if (this.otherInformation != null) {
      data['Other information'] = this.otherInformation!.toJson();
    }
    return data;
  }
}

class AboutTheTour {
  String? title;
  String? subtitle;
  String? description;

  AboutTheTour({this.title, this.subtitle, this.description});

  AboutTheTour.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    return data;
  }
}

class TourInformation {
  String? duration;
  String? startPoint;
  String? endPoint;
  String? returnStartPoint;
  String? returnEndPoint;

  TourInformation(
      {this.duration,
        this.startPoint,
        this.endPoint,
        this.returnStartPoint,
        this.returnEndPoint});

  TourInformation.fromJson(Map<String, dynamic> json) {
    duration = json['Duration'];
    startPoint = json['Start Point'];
    endPoint = json['End Point'];
    returnStartPoint = json['Return Start Point'];
    returnEndPoint = json['Return End Point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Duration'] = this.duration;
    data['Start Point'] = this.startPoint;
    data['End Point'] = this.endPoint;
    data['Return Start Point'] = this.returnStartPoint;
    data['Return End Point'] = this.returnEndPoint;
    return data;
  }
}

class TravelDetail {
  String? travelOption;
  String? departureFromDate;
  String? departureToDate;
  String? departureTime;
  String? pickupTime;
  String? dropTime;
  String? returnTravelOption;
  String? returnFromDate;
  String? returnToDate;
  String? returnDepartureTime;
  String? returnPickupTime;
  String? returnDropTime;

  TravelDetail(
      {this.travelOption,
        this.departureFromDate,
        this.departureToDate,
        this.departureTime,
        this.pickupTime,
        this.dropTime,
        this.returnTravelOption,
        this.returnFromDate,
        this.returnToDate,
        this.returnDepartureTime,
        this.returnPickupTime,
        this.returnDropTime});

  TravelDetail.fromJson(Map<String, dynamic> json) {
    travelOption = json['Travel_option'];
    departureFromDate = json['departure_from_date'];
    departureToDate = json['departure_to_date'];
    departureTime = json['Departure_time'];
    pickupTime = json['pickup_time'];
    dropTime = json['drop_time'];
    returnTravelOption = json['Return travel option'];
    returnFromDate = json['Return_from_date'];
    returnToDate = json['Return_to_date'];
    returnDepartureTime = json['Return departure time'];
    returnPickupTime = json['Return_pickup_time'];
    returnDropTime = json['Return_drop_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Travel_option'] = this.travelOption;
    data['departure_from_date'] = this.departureFromDate;
    data['departure_to_date'] = this.departureToDate;
    data['Departure_time'] = this.departureTime;
    data['pickup_time'] = this.pickupTime;
    data['drop_time'] = this.dropTime;
    data['Return travel option'] = this.returnTravelOption;
    data['Return_from_date'] = this.returnFromDate;
    data['Return_to_date'] = this.returnToDate;
    data['Return departure time'] = this.returnDepartureTime;
    data['Return_pickup_time'] = this.returnPickupTime;
    data['Return_drop_time'] = this.returnDropTime;
    return data;
  }
}

class Transport {
  String? transfer;
  String? returnTransfer;

  Transport({this.transfer, this.returnTransfer});

  Transport.fromJson(Map<String, dynamic> json) {
    transfer = json['transfer'];
    returnTransfer = json['return_transfer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transfer'] = this.transfer;
    data['return_transfer'] = this.returnTransfer;
    return data;
  }
}

class Hotel {
  String? hotelName;
  String? hotelType;
  String? hotelImage;
  String? location;
  String? noOfNight;

  Hotel(
      {this.hotelName,
        this.hotelType,
        this.hotelImage,
        this.location,
        this.noOfNight});

  Hotel.fromJson(Map<String, dynamic> json) {
    hotelName = json['hotel_name'];
    hotelType = json['hotel_type'];
    hotelImage = json['hotel_image'];
    location = json['location'];
    noOfNight = json['no_of_night'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel_name'] = this.hotelName;
    data['hotel_type'] = this.hotelType;
    data['hotel_image'] = this.hotelImage;
    data['location'] = this.location;
    data['no_of_night'] = this.noOfNight;
    return data;
  }
}

class Itinerary {
  String? date;
  String? daysTitle;
  String? dayDescription;

  Itinerary({this.date, this.daysTitle, this.dayDescription});

  Itinerary.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    daysTitle = json['Days_title'];
    dayDescription = json['Day_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Days_title'] = this.daysTitle;
    data['Day_description'] = this.dayDescription;
    return data;
  }
}

class OtherInformation {
  List<String>? title;
  List<String>? description;

  OtherInformation({this.title, this.description});

  OtherInformation.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<String>();
    description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}