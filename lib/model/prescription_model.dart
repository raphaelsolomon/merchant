class PrescriptionModel {
  final bool? status;
  final String? message;
  final List<Data>? data;

  PrescriptionModel({
    this.status,
    this.message,
    this.data,
  });

  PrescriptionModel.fromJson(Map<String, dynamic> json)
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
  final dynamic patientId;
  final String? name;
  final String? quantity;
  final String? days;
  final List<String>? time;
  final String? signature;
  final String? createdAt;

  Data({
    this.id,
    this.doctorName,
    this.specialization,
    this.patientId,
    this.name,
    this.quantity,
    this.days,
    this.time,
    this.signature,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      doctorName = json['doctor_name'] as String?,
      specialization = json['specialization'] as String?,
      patientId = json['patient_id'],
      name = json['name'] as String?,
      quantity = json['quantity'] as String?,
      days = json['days'] as String?,
      time = (json['time'] as List?)?.map((dynamic e) => e as String).toList(),
      signature = json['signature'] as String?,
      createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'doctor_name' : doctorName,
    'specialization' : specialization,
    'patient_id' : patientId,
    'name' : name,
    'quantity' : quantity,
    'days' : days,
    'time' : time,
    'signature' : signature,
    'created_at' : createdAt
  };
}