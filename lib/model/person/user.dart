import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  bool? verified;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? country;
  @HiveField(6)
  String? profilePhoto;
  @HiveField(7)
  String? token;
  @HiveField(8)
  String? city;
  @HiveField(9)
  String? state;
  @HiveField(10)
  String? dob;
  @HiveField(11)
  String? bloodgroup;
  @HiveField(12)
  String? address;
  @HiveField(13)
  String? zip_code;
  @HiveField(14)
  String? created_at;
  @HiveField(15)
  bool? onboarded;

  User(
      {this.uid,
      this.name,
      this.email,
      this.verified,
      this.phone,
      this.country,
      this.profilePhoto,
      this.token,
      this.city,
      this.state,
      this.bloodgroup,
      this.dob,
      this.address,
      this.zip_code,
      this.created_at,
      this.onboarded});

  Map toMap(User user) {
    var data = <String, dynamic>{};
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['is_verified'] = user.verified;
    data["phone"] = user.phone;
    data["country"] = user.country;
    data["profile_picture"] = user.profilePhoto;
    data["token"] = user.token;
    data["city"] = user.city;
    data["state"] = user.state;
    data["zip_code"] = user.zip_code;
    data["address"] = user.address;
    data["blood_group"] = user.bloodgroup;
    data["created_at"] = user.created_at;
    data["dob"] = user.dob;
    data['onboarded'] = user.onboarded;
    return data;
  }

  // Named constructor
  User.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'];
    name = mapData['name'];
    email = mapData['email'];
    verified = mapData['verified'];
    phone = mapData['phone'];
    country = mapData['country'];
    profilePhoto = mapData['profile_picture'];
    token = mapData['token'];
    city = mapData['city'];
    state = mapData['state'];
    zip_code = mapData['zip_code'];
    dob = mapData['dob'];
    address = mapData['address'];
    bloodgroup = mapData['blood_group'];
    created_at = mapData['created_at'];
    onboarded = mapData['onboarded'];
  }
}
