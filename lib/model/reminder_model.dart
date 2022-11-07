class ReminderModel {
  final dynamic status;
  final String? message;
  final List<Data>? data;
  

  ReminderModel({
    this.status,
    this.message,
    this.data
  });

  ReminderModel.fromJson(Map<String, dynamic> json)
    : status = json['status'],
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
  final String? patientId;
  final String? pillName;
  final List<ReminderDates>? reminderDates;
  final String? frequency;
  final String? noOfTimes;
  final String? createdAt;
  bool isDeleteLoading;

  Data({
    this.id,
    this.patientId,
    this.pillName,
    this.reminderDates,
    this.frequency,
    this.noOfTimes,
    this.createdAt,
    this.isDeleteLoading = false
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      patientId = json['patient_id'] as String?,
      pillName = json['pill_name'] as String?,
      reminderDates = (json['reminder_dates'] as List?)?.map((dynamic e) => ReminderDates.fromJson(e as Map<String,dynamic>)).toList(),
      frequency = json['frequency'] as String?,
      noOfTimes = json['no_of_times'] as String?,
      createdAt = json['created_at'] as String?,
      isDeleteLoading = false;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'patient_id' : patientId,
    'pill_name' : pillName,
    'reminder_dates' : reminderDates?.map((e) => e.toJson()).toList(),
    'frequency' : frequency,
    'no_of_times' : noOfTimes,
    'created_at' : createdAt
  };


  setisDeleteLoading(bool b) {
    this.isDeleteLoading = b; 
  }
}

class ReminderDates {
  final String? date;

  ReminderDates({
    this.date,
  });

  ReminderDates.fromJson(Map<String, dynamic> json)
    : date = json['date'] as String?;

  Map<String, dynamic> toJson() => {
    'date' : date
  };
}