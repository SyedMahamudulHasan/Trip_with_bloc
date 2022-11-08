class TripModel {
  String? requestTripId;
  TripInformation? tripInformation;
  String? tripStatus;

  TripModel({this.requestTripId, this.tripInformation, this.tripStatus});

  TripModel.fromJson(Map<String, dynamic> json) {
    requestTripId = json['request_trip_id'];
    tripInformation = json['trip_information'] != null
        ? new TripInformation.fromJson(json['trip_information'])
        : null;
    tripStatus = json['trip_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_trip_id'] = this.requestTripId;
    if (this.tripInformation != null) {
      data['trip_information'] = this.tripInformation!.toJson();
    }
    data['trip_status'] = this.tripStatus;
    return data;
  }
}

class TripInformation {
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? webUrl;
  String? vehicleType;
  int? numberOfPeople;
  int? luggage;
  int? maxWeight;
  int? childSeat;
  String? pickupPoint;
  String? destination;
  String? date;
  String? pickupTime;
  List<String>? stops;

  TripInformation(
      {this.fullName,
      this.email,
      this.phone,
      this.address,
      this.webUrl,
      this.vehicleType,
      this.numberOfPeople,
      this.luggage,
      this.maxWeight,
      this.childSeat,
      this.pickupPoint,
      this.destination,
      this.date,
      this.pickupTime,
      this.stops});

  TripInformation.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    webUrl = json['web_url'];
    vehicleType = json['vehicle_type'];
    numberOfPeople = json['number_of_people'];
    luggage = json['luggage'];
    maxWeight = json['max_weight'];
    childSeat = json['child_seat'];
    pickupPoint = json['pickup_point'];
    destination = json['destination'];
    date = json['date'];
    pickupTime = json['pickup_time'];
    stops = json['stops'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['web_url'] = this.webUrl;
    data['vehicle_type'] = this.vehicleType;
    data['number_of_people'] = this.numberOfPeople;
    data['luggage'] = this.luggage;
    data['max_weight'] = this.maxWeight;
    data['child_seat'] = this.childSeat;
    data['pickup_point'] = this.pickupPoint;
    data['destination'] = this.destination;
    data['date'] = this.date;
    data['pickup_time'] = this.pickupTime;
    data['stops'] = this.stops;
    return data;
  }
}
