class FavouriteModel {
  final bool? status;
  final String? message;
  final List<Data>? data;

  FavouriteModel({
    this.status,
    this.message,
    this.data,
  });

  FavouriteModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as bool?,
      message = json['message'] as String?,
      data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? specialization;
  final String? avatar;
  final String? address;
  final String? city;
  final String? state;
  final dynamic country;
  final String? consultationFee;
  final String? consultMode;
  final String? consultLanguage;
  final String? currency;

  Data({
    this.id,
    this.name,
    this.email,
    this.specialization,
    this.avatar,
    this.address,
    this.city,
    this.state,
    this.country,
    this.consultationFee,
    this.consultMode,
    this.consultLanguage,
    this.currency,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      email = json['email'] as String?,
      specialization = json['specialization'] as String?,
      avatar = json['avatar'] as String?,
      address = json['address'] as String?,
      city = json['city'] as String?,
      state = json['state'] as String?,
      country = json['country'],
      consultationFee = json['consultation_fee'] as String?,
      consultMode = json['consult_mode'] as String?,
      consultLanguage = json['consult_language'] as String?,
      currency = json['currency'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'specialization' : specialization,
    'avatar' : avatar,
    'address' : address,
    'city' : city,
    'state' : state,
    'country' : country,
    'consultation_fee' : consultationFee,
    'consult_mode' : consultMode,
    'consult_language' : consultLanguage,
    'currency' : currency
  };
}