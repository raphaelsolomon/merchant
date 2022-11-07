// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      uid: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      verified: fields[3] as bool?,
      phone: fields[4] as String?,
      country: fields[5] as String?,
      profilePhoto: fields[6] as String?,
      token: fields[7] as String?,
      city: fields[8] as String?,
      state: fields[9] as String?,
      bloodgroup: fields[11] as String?,
      dob: fields[10] as String?,
      address: fields[12] as String?,
      zip_code: fields[13] as String?,
      created_at: fields[14] as String?,
      onboarded: fields[15] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.verified)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.profilePhoto)
      ..writeByte(7)
      ..write(obj.token)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.dob)
      ..writeByte(11)
      ..write(obj.bloodgroup)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.zip_code)
      ..writeByte(14)
      ..write(obj.created_at)
      ..writeByte(15)
      ..write(obj.onboarded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
