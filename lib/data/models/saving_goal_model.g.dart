part of 'saving_goal_model.dart';

class SavingGoalModelAdapter extends TypeAdapter<SavingGoalModel> {
  @override
  final int typeId = 2;

  @override
  SavingGoalModel read(BinaryReader r) {final n = r.readByte(); final f=<int,dynamic>{for(int i=0;i<n;i++) r.readByte():r.read()}; return SavingGoalModel(id:f[0],userId:f[1],name:f[2],targetAmount:f[3],savedAmount:f[4],monthlyContribution:f[5],startDate:f[6],targetDate:f[7],isSynced:f[8]);}

  @override
  void write(BinaryWriter w, SavingGoalModel o) {w..writeByte(9)..writeByte(0)..write(o.id)..writeByte(1)..write(o.userId)..writeByte(2)..write(o.name)..writeByte(3)..write(o.targetAmount)..writeByte(4)..write(o.savedAmount)..writeByte(5)..write(o.monthlyContribution)..writeByte(6)..write(o.startDate)..writeByte(7)..write(o.targetDate)..writeByte(8)..write(o.isSynced);} 
}
