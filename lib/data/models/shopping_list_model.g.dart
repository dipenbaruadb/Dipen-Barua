part of 'shopping_list_model.dart';

class ShoppingItemModelAdapter extends TypeAdapter<ShoppingItemModel> {
  @override
  final int typeId = 4;
  @override
  ShoppingItemModel read(BinaryReader r){final n=r.readByte();final f=<int,dynamic>{for(int i=0;i<n;i++) r.readByte():r.read()};return ShoppingItemModel(name:f[0],plannedPrice:f[1],actualPrice:f[2],isPurchased:f[3]);}
  @override
  void write(BinaryWriter w, ShoppingItemModel o){w..writeByte(4)..writeByte(0)..write(o.name)..writeByte(1)..write(o.plannedPrice)..writeByte(2)..write(o.actualPrice)..writeByte(3)..write(o.isPurchased);} }

class ShoppingListModelAdapter extends TypeAdapter<ShoppingListModel> {
  @override
  final int typeId = 5;
  @override
  ShoppingListModel read(BinaryReader r){final n=r.readByte();final f=<int,dynamic>{for(int i=0;i<n;i++) r.readByte():r.read()};return ShoppingListModel(id:f[0],userId:f[1],title:f[2],items:(f[3] as List).cast<ShoppingItemModel>(),isSynced:f[4]);}
  @override
  void write(BinaryWriter w, ShoppingListModel o){w..writeByte(5)..writeByte(0)..write(o.id)..writeByte(1)..write(o.userId)..writeByte(2)..write(o.title)..writeByte(3)..write(o.items)..writeByte(4)..write(o.isSynced);} }
