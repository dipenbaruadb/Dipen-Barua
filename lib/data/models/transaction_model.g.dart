part of 'transaction_model.dart';

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 0;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      type: fields[2] as String,
      amount: fields[3] as double,
      currency: fields[4] as String,
      categoryId: fields[5] as String,
      categoryName: fields[6] as String,
      date: fields[7] as DateTime,
      paymentMethod: fields[8] as String,
      note: fields[9] as String?,
      tags: (fields[10] as List).cast<String>(),
      isRecurring: fields[11] as bool,
      recurringFrequency: fields[12] as String?,
      createdAt: fields[13] as DateTime,
      updatedAt: fields[14] as DateTime,
      isSynced: fields[15] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.categoryName)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.paymentMethod)
      ..writeByte(9)
      ..write(obj.note)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.isRecurring)
      ..writeByte(12)
      ..write(obj.recurringFrequency)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.isSynced);
  }
}
