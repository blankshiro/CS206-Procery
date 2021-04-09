// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GroceryList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryListAdapter extends TypeAdapter<GroceryList> {
  @override
  final int typeId = 6;

  @override
  GroceryList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroceryList(
      name: fields[0] as String,
      deadLine: fields[1] as DateTime,
      purchases: (fields[2] as List)?.cast<Purchase>(),
      type: fields[5] as int,
      collabs: (fields[7] as List)?.cast<String>(),
      active: fields[4] as int,
      id: fields[6] as int,
    )..completionPercent = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, GroceryList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.deadLine)
      ..writeByte(2)
      ..write(obj.purchases)
      ..writeByte(3)
      ..write(obj.completionPercent)
      ..writeByte(4)
      ..write(obj.active)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.collabs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
