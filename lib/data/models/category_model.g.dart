part of 'category_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 1;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()};
    return CategoryModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      nameBn: fields[2] as String,
      nameEn: fields[3] as String,
      icon: fields[4] as String,
      color: fields[5] as int,
      type: fields[6] as String,
      isSynced: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)..write(obj.id)
      ..writeByte(1)..write(obj.userId)
      ..writeByte(2)..write(obj.nameBn)
      ..writeByte(3)..write(obj.nameEn)
      ..writeByte(4)..write(obj.icon)
      ..writeByte(5)..write(obj.color)
      ..writeByte(6)..write(obj.type)
      ..writeByte(7)..write(obj.isSynced);
  }
}
