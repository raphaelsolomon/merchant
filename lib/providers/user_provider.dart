import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/person/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  Map<String, dynamic> profile = {};

  void executeThis() {
    Hive.box<User>(BoxName).put(
        USERPATH,
        User(
            address: '19, Invaded Street',
            uid: '123i4',
            name: 'Uchiha Madara',
            email: 'Phoenixk54@gmail.com',
            country: '116',
            state: 'Lagos',
            city: 'Igondo',
            token: '',
            verified: false,
            bloodgroup: 'O-',
            dob: '11-11-11',
            profilePhoto: '',
            phone: '09067618740'));
  }

  User get getUser => _user!;

  setProfile(data) {
    this.profile = data;
    print(data);
  }
}
