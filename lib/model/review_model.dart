class ReviewsModel {
  final bool? status;
  final String? message;
  final List<Data>? data;

  ReviewsModel({
    this.status,
    this.message,
    this.data,
  });

  ReviewsModel.fromJson(Map<String, dynamic> json)
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
  final String? doctorName;
  final String? specialization;
  final String? patientName;
  final String? patientPicture;
  final String? rating;
  final String? review;
  final String? createdAt;

  Data({
    this.id,
    this.doctorName,
    this.specialization,
    this.patientName,
    this.patientPicture,
    this.rating,
    this.review,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      doctorName = json['doctor_name'] as String?,
      specialization = json['specialization'] as String?,
      patientName = json['patient_name'] as String?,
      patientPicture = json['patient_picture'] as String?,
      rating = json['rating'] as String?,
      review = json['review'] as String?,
      createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'doctor_name' : doctorName,
    'specialization' : specialization,
    'patient_name' : patientName,
    'patient_picture' : patientPicture,
    'rating' : rating,
    'review' : review,
    'created_at' : createdAt
  };
}