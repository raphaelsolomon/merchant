class ReferralModel {

  final bool? status;
  final String? message;
  final Data? data;

  ReferralModel({
    this.status,
    this.message,
    this.data,
  });

  ReferralModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as bool?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final String? referralCode;
  final String? facebookLink;
  final String? twitterLink;
  final String? whatsappLink;

  Data({
    this.referralCode,
    this.facebookLink,
    this.twitterLink,
    this.whatsappLink,
  });

  Data.fromJson(Map<String, dynamic> json)
    : referralCode = json['referral_code'] as String?,
      facebookLink = json['facebook_link'] as String?,
      twitterLink = json['twitter_link'] as String?,
      whatsappLink = json['whatsapp_link'] as String?;

  Map<String, dynamic> toJson() => {
    'referral_code' : referralCode,
    'facebook_link' : facebookLink,
    'twitter_link' : twitterLink,
    'whatsapp_link' : whatsappLink
  };
}