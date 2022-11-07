import 'package:flutter/material.dart';
import 'package:merchant/model/person/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  Map<String, dynamic> profile = {};

  User get getUser => _user!;

  setProfile(data) {
    this.profile = data;
    print(data);
  }
}
