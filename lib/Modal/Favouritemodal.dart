class Favouritemodal {
  int? status;
  String? message;
  Data? data;

  Favouritemodal({this.status, this.message, this.data});

  Favouritemodal.fromJson(Map<String, dynamic> json) {
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
  String? iteId;
  String? userId;
  String? clientId;
  String? itineraryId;
  String? travelOption;
  String? flightNo;
  String? overnightAccommodation;
  String? carParking;
  String? transfer;
  String? departureTime;
  String? pickupLocation;
  String? dropLocation;
  String? depFromDate;
  String? depToDate;
  String? pickupTime;
  String? dropTime;
  String? returnCarParking;
  String? returnOvernoghtAcco;
  String? returnTravelOption;
  String? returnTransfer;
  String? returnTime;
  String? returnPickupLocation;
  String? returnDropLocation;
  String? returnFromDate;
  String? returnToDate;
  String? returnPickupTime;
  String? returnDropTime;
  String? returnFlightNo;
  String? hotelName;
  String? hotelType;
  String? hotelImg;
  String? noOfRoom;
  String? roomDetail;
  String? mealArragement;
  String? checkInDate;
  String? checkOutDate;
  String? location;
  String? noOfNightStay;
  String? totalAmt;
  String? deposit;
  String? paymentMode;
  String? passportVisa;
  String? drivingLicence;
  String? vaccinationReq;
  String? currency;
  String? insuranceAllowance;
  String? insuranceDet;
  String? luggageAllowance;
  String? luggageDetail;
  String? notes;
  String? healthReq;
  String? entryReq;
  String? seatRequest;
  String? dietaryRequirement;
  String? upToDate;
  String? cancellationCharge;
  String? norefundableDate;
  String? weather;
  String? isFavourite;
  String? createdDate;
  String? updatedDate;

  Data(
      {this.iteId,
        this.userId,
        this.clientId,
        this.itineraryId,
        this.travelOption,
        this.flightNo,
        this.overnightAccommodation,
        this.carParking,
        this.transfer,
        this.departureTime,
        this.pickupLocation,
        this.dropLocation,
        this.depFromDate,
        this.depToDate,
        this.pickupTime,
        this.dropTime,
        this.returnCarParking,
        this.returnOvernoghtAcco,
        this.returnTravelOption,
        this.returnTransfer,
        this.returnTime,
        this.returnPickupLocation,
        this.returnDropLocation,
        this.returnFromDate,
        this.returnToDate,
        this.returnPickupTime,
        this.returnDropTime,
        this.returnFlightNo,
        this.hotelName,
        this.hotelType,
        this.hotelImg,
        this.noOfRoom,
        this.roomDetail,
        this.mealArragement,
        this.checkInDate,
        this.checkOutDate,
        this.location,
        this.noOfNightStay,
        this.totalAmt,
        this.deposit,
        this.paymentMode,
        this.passportVisa,
        this.drivingLicence,
        this.vaccinationReq,
        this.currency,
        this.insuranceAllowance,
        this.insuranceDet,
        this.luggageAllowance,
        this.luggageDetail,
        this.notes,
        this.healthReq,
        this.entryReq,
        this.seatRequest,
        this.dietaryRequirement,
        this.upToDate,
        this.cancellationCharge,
        this.norefundableDate,
        this.weather,
        this.isFavourite,
        this.createdDate,
        this.updatedDate});

  Data.fromJson(Map<String, dynamic> json) {
    iteId = json['ite_id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    itineraryId = json['itinerary_id'];
    travelOption = json['travel_option'];
    flightNo = json['flight_no'];
    overnightAccommodation = json['overnight_accommodation'];
    carParking = json['car_parking'];
    transfer = json['transfer'];
    departureTime = json['departure_time'];
    pickupLocation = json['pickup_location'];
    dropLocation = json['drop_location'];
    depFromDate = json['dep_from_date'];
    depToDate = json['dep_to_date'];
    pickupTime = json['pickup_time'];
    dropTime = json['drop_time'];
    returnCarParking = json['return_car_parking'];
    returnOvernoghtAcco = json['return_overnoght_acco'];
    returnTravelOption = json['return_travel_option'];
    returnTransfer = json['return_transfer'];
    returnTime = json['return_time'];
    returnPickupLocation = json['return_pickup_location'];
    returnDropLocation = json['return_drop_location'];
    returnFromDate = json['return_from_date'];
    returnToDate = json['return_to_date'];
    returnPickupTime = json['return_pickup_time'];
    returnDropTime = json['return_drop_time'];
    returnFlightNo = json['return_flight_no'];
    hotelName = json['hotel_name'];
    hotelType = json['hotel_type'];
    hotelImg = json['hotel_img'];
    noOfRoom = json['no_of_room'];
    roomDetail = json['room_detail'];
    mealArragement = json['meal_arragement'];
    checkInDate = json['check_in_date'];
    checkOutDate = json['check_out_date'];
    location = json['location'];
    noOfNightStay = json['no_of_night_stay'];
    totalAmt = json['total_amt'];
    deposit = json['deposit'];
    paymentMode = json['payment_mode'];
    passportVisa = json['passport_visa'];
    drivingLicence = json['driving_licence'];
    vaccinationReq = json['vaccination_req'];
    currency = json['currency'];
    insuranceAllowance = json['insurance_allowance'];
    insuranceDet = json['insurance_det'];
    luggageAllowance = json['luggage_allowance'];
    luggageDetail = json['luggage_detail'];
    notes = json['notes'];
    healthReq = json['health_req'];
    entryReq = json['entry_req'];
    seatRequest = json['seat_request'];
    dietaryRequirement = json['dietary_requirement'];
    upToDate = json['up_to_date'];
    cancellationCharge = json['cancellation_charge'];
    norefundableDate = json['norefundable_date'];
    weather = json['weather'];
    isFavourite = json['is_favourite'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ite_id'] = this.iteId;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['itinerary_id'] = this.itineraryId;
    data['travel_option'] = this.travelOption;
    data['flight_no'] = this.flightNo;
    data['overnight_accommodation'] = this.overnightAccommodation;
    data['car_parking'] = this.carParking;
    data['transfer'] = this.transfer;
    data['departure_time'] = this.departureTime;
    data['pickup_location'] = this.pickupLocation;
    data['drop_location'] = this.dropLocation;
    data['dep_from_date'] = this.depFromDate;
    data['dep_to_date'] = this.depToDate;
    data['pickup_time'] = this.pickupTime;
    data['drop_time'] = this.dropTime;
    data['return_car_parking'] = this.returnCarParking;
    data['return_overnoght_acco'] = this.returnOvernoghtAcco;
    data['return_travel_option'] = this.returnTravelOption;
    data['return_transfer'] = this.returnTransfer;
    data['return_time'] = this.returnTime;
    data['return_pickup_location'] = this.returnPickupLocation;
    data['return_drop_location'] = this.returnDropLocation;
    data['return_from_date'] = this.returnFromDate;
    data['return_to_date'] = this.returnToDate;
    data['return_pickup_time'] = this.returnPickupTime;
    data['return_drop_time'] = this.returnDropTime;
    data['return_flight_no'] = this.returnFlightNo;
    data['hotel_name'] = this.hotelName;
    data['hotel_type'] = this.hotelType;
    data['hotel_img'] = this.hotelImg;
    data['no_of_room'] = this.noOfRoom;
    data['room_detail'] = this.roomDetail;
    data['meal_arragement'] = this.mealArragement;
    data['check_in_date'] = this.checkInDate;
    data['check_out_date'] = this.checkOutDate;
    data['location'] = this.location;
    data['no_of_night_stay'] = this.noOfNightStay;
    data['total_amt'] = this.totalAmt;
    data['deposit'] = this.deposit;
    data['payment_mode'] = this.paymentMode;
    data['passport_visa'] = this.passportVisa;
    data['driving_licence'] = this.drivingLicence;
    data['vaccination_req'] = this.vaccinationReq;
    data['currency'] = this.currency;
    data['insurance_allowance'] = this.insuranceAllowance;
    data['insurance_det'] = this.insuranceDet;
    data['luggage_allowance'] = this.luggageAllowance;
    data['luggage_detail'] = this.luggageDetail;
    data['notes'] = this.notes;
    data['health_req'] = this.healthReq;
    data['entry_req'] = this.entryReq;
    data['seat_request'] = this.seatRequest;
    data['dietary_requirement'] = this.dietaryRequirement;
    data['up_to_date'] = this.upToDate;
    data['cancellation_charge'] = this.cancellationCharge;
    data['norefundable_date'] = this.norefundableDate;
    data['weather'] = this.weather;
    data['is_favourite'] = this.isFavourite;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}