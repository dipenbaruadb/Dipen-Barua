part of 'loan_model.dart';
class LoanModelAdapter extends TypeAdapter<LoanModel> {
  @override
  final int typeId = 3;
  @override
  LoanModel read(BinaryReader r){final n=r.readByte();final f=<int,dynamic>{for(int i=0;i<n;i++) r.readByte():r.read()};return LoanModel(id:f[0],userId:f[1],personName:f[2],amount:f[3],paidAmount:f[4],remainingAmount:f[5],dueDate:f[6],status:f[7],isSynced:f[8]);}
  @override
  void write(BinaryWriter w, LoanModel o){w..writeByte(9)..writeByte(0)..write(o.id)..writeByte(1)..write(o.userId)..writeByte(2)..write(o.personName)..writeByte(3)..write(o.amount)..writeByte(4)..write(o.paidAmount)..writeByte(5)..write(o.remainingAmount)..writeByte(6)..write(o.dueDate)..writeByte(7)..write(o.status)..writeByte(8)..write(o.isSynced);} 
}
