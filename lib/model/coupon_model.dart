class CouponModel {
  final bool? status;
  final String? message;
  final List<Data>? data;

  CouponModel({
    this.status,
    this.message,
    this.data,
  });

  CouponModel.fromJson(Map<String, dynamic> json)
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
  final String? couponCode;
  final String? description;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final String? discountType;
  final String? discountValue;

  Data({
    this.id,
    this.couponCode,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.discountType,
    this.discountValue,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      couponCode = json['coupon_code'] as String?,
      description = json['description'] as String?,
      status = json['status'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      discountType = json['discount_type'] as String?,
      discountValue = json['discount_value'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'coupon_code' : couponCode,
    'description' : description,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'discount_type' : discountType,
    'discount_value' : discountValue
  };
}