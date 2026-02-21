part of 'user_profile_model.dart';

class UserProfileModelAdapter extends TypeAdapter<UserProfileModel> {
  @override
  final int typeId = 6;

  @override
  UserProfileModel read(BinaryReader r){final n=r.readByte();final f=<int,dynamic>{for(int i=0;i<n;i++) r.readByte():r.read()};return UserProfileModel(id:f[0],name:f[1],email:f[2],phone:f[3],language:f[4],currency:f[5],createdAt:f[6]);}

  @override
  void write(BinaryWriter w, UserProfileModel o){w..writeByte(7)..writeByte(0)..write(o.id)..writeByte(1)..write(o.name)..writeByte(2)..write(o.email)..writeByte(3)..write(o.phone)..writeByte(4)..write(o.language)..writeByte(5)..write(o.currency)..writeByte(6)..write(o.createdAt);} 
}
