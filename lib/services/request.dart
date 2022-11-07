import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/prescription_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:merchant/dialog/subscribe.dart' as popupMessage;
import 'package:pull_to_refresh/pull_to_refresh.dart';

const String ROOTAPI = 'https://patientapi.gettheskydoctors.com';

class ApiServices {
  String GOOGLEAPI = 'https://fcm.googleapis.com/fcm/send';

  void sendNotification(token) async {
    final res = await http.post(Uri.parse(GOOGLEAPI), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'key=${FIREBASE_WEB_TOKEN}'
    }, body: {
      'to': token,
      'priority': 'high',
      'notification': jsonEncode({
        'title': 'Notification',
        'body': 'Notification body',
      })
    });
    if (res.statusCode == 200) {}
  }

  static Future<String> downloadFile(String url, String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$filename';
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  static Future<Map<String, dynamic>> getProfile(token) async {
    final response = await http.Client().get(Uri.parse('${ROOTAPI}/api/v1/auth/patient/profile'), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      return parsed;
    }
    return {};
  }

  static Future<void> changePassword(BuildContext c, token, oldPass, newPass) async {
    var request = http.Request('PATCH', Uri.parse('${ROOTAPI}/api/patient/change-password'));
    request.body = '''{\n    "old_password": "${oldPass}",\n    "new_password": "${newPass}"\n}''';
    request.headers.addAll({'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       final parsed = jsonDecode(await response.stream.bytesToString());
        popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['success']['message'], status: true));
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  static Future<void> updateProfile(BuildContext c, token, body) async {
    var request = http.Request('PATCH', Uri.parse('${ROOTAPI}/api/v1/auth/patient/update-profile'));
    request.body = jsonEncode({"url": "http://patient.gettheskydoctors.com", "name": "Uchiha Madara"});
    request.headers.addAll({'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       final parsed = jsonDecode(await response.stream.bytesToString());
        popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['success']['message'], status: true));
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  //================================ MEDICAL RECORD SET =================================
  static Future<Map<String, dynamic>> getAllMedicalRecords(BuildContext c, token) async {
    var request = http.Request('GET', Uri.parse('${ROOTAPI}/api/v1/auth/patient/records/all-medical-records'));
    request.headers.addAll({'Authorization': '$token'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       return response.stream.bytesToString().then((value) {
          return jsonDecode(value);
       });
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
      return {};
    }
  }

  static Future addMedicalRecord(BuildContext c, token) async {
    var request = http.Request('GET', Uri.parse('${ROOTAPI}/api/v1/auth/patient/records/add-medical-record'));
    request.body = jsonEncode({"url": "http://patient.gettheskydoctors.com", "name": "", "date": "", "description": "", "attachment": "", "ordered_by": ""});
    request.headers.addAll({'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       final parsed = jsonDecode(await response.stream.bytesToString());
       return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['success']['message'], status: true));
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

   //================================ DEPENDENTS =================================
   static Future<Map<String, dynamic>> getAllDepends(BuildContext c, token) async {
    var request = http.Request('GET', Uri.parse('${ROOTAPI}/api/v1/auth/patient/dependents/all-dependents'));
    request.headers.addAll({'Authorization': '$token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
     return response.stream.bytesToString().then((value) {
         return jsonDecode(value);
     });
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
      return {};
    }
  }

  static Future addDependents(BuildContext c, token) async {
    var request = http.Request('POST', Uri.parse('${ROOTAPI}/api/v1/auth/patient/dependents/add-dependent'));
    request.body = jsonEncode({"url": "http://patient.gettheskydoctors.com", "name": "John Doe", "picture": "test-picure", "relationship": "test-relationship", "gender": "test-gender", "number": "34567890", "bloodgroup": "A+"});
    request.headers.addAll({'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       final parsed = jsonDecode(await response.stream.bytesToString());
       return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['success']['message'], status: true));
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  static Future deleteDependent(BuildContext c, token, id, callBack) async {
    callBack();
    var request = http.Request('DELETE', Uri.parse('${ROOTAPI}/api/v1/auth/patient/dependents/delete-dependent/${id}'));
    request.headers.addAll({'Authorization': '$token'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return response.stream.bytesToString().then((value) {
        callBack();
           final parsed = jsonDecode(value);
          return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['message'], status: true));
       });
    } else {
       return response.stream.bytesToString().then((value) {
          return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, jsonDecode(value)['message'], status: false));
       });
    }
  }

  static Future updateDependent(BuildContext c, token, id) async {
    var request = http.Request('PATCH', Uri.parse('${ROOTAPI}/api/v1/auth/patient/dependents/edit-dependent/${id}'));
    request.headers.addAll({'Authorization': '$token'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       return response.stream.bytesToString().then((value) {
          return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, jsonDecode(value)['success']['message'], status: true));
       });
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  //================================ MEDICAL OTHER RECORD SET =================================
  static Future<Map<String, dynamic>> getAllOtherMedicalRecords(BuildContext c, token) async {
    var request = http.Request('GET', Uri.parse('${ROOTAPI}/api/v1/auth/patient/records/other-medical-record/all'));
    request.headers.addAll({'Authorization': '$token'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       return response.stream.bytesToString().then((value) {
          return jsonDecode(value);
       });
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
      return {};
    }
  }

  static Future addOtherMedicalRecord(BuildContext c, token) async {
    var request = http.Request('POST', Uri.parse('${ROOTAPI}/api/v1/auth/patient/records/add-other-medical-record'));
    request.body = jsonEncode({"url": "http://patient.gettheskydoctors.com", "name": "Test", "bmi": "", "heart_rate": "", "fbc_status": "", "weight": ""});
    request.headers.addAll({'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       final parsed = jsonDecode(await response.stream.bytesToString());
       return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['success']['message'], status: true));
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  static Future updateOtherMedicalRecord(BuildContext c, token, id) async {
    var request = http.Request('POST', Uri.parse('${ROOTAPI}/api/v1/auth/patient/records/other-medical-record/edit/${id}'));
    request.body = jsonEncode({"url": "http://patient.gettheskydoctors.com", "name": "Test", "bmi": "", "heart_rate": "", "fbc_status": "", "weight": ""});
    request.headers.addAll({'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       final parsed = jsonDecode(await response.stream.bytesToString());
       return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['success']['message'], status: true));
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  static Future deleteOtherMedicalRecord(BuildContext c, token, id, callBack) async {
    callBack();
    var request = http.Request('DELETE', Uri.parse('${ROOTAPI}/api/v1/auth/patient/records/other-medical-record/delete/${id}'));
    request.headers.addAll({'Authorization': '$token'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
       return response.stream.bytesToString().then((value) {
          callBack();
          return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, jsonDecode(value)['message'], status: true));
       });
    } else {
      final parsed = jsonDecode(await response.stream.bytesToString());
      return popupMessage.dialogMessage(c,  popupMessage.serviceMessage(c, parsed['error']['message'], status: false));
    }
  }

  //======================================PRESCRIPTION================================================================
  static Future<PrescriptionModel> getPrescriptions(RefreshController controller, box) async {
    PrescriptionModel model = new PrescriptionModel();
    var request = http.Request('GET', Uri.parse('${ROOTAPI}/api/v1/auth/patient/prescriptions/all'));
    request.headers.addAll({'Authorization': '${box.get(USERPATH)!.token}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      controller.refreshCompleted();
      return response.stream.bytesToString().then((value) {
        return model = PrescriptionModel.fromJson(jsonDecode(value));
      });
    }
    controller.refreshFailed();
    return model;
  }
}
