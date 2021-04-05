// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlannerRecord.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlannerRecordAdapter extends TypeAdapter<PlannerRecord> {
  @override
  final int typeId = 4;

  @override
  PlannerRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlannerRecord(
      recipe: fields[0] as Recipe,
      date: fields[1] as DateTime,
      meal: fields[2] as String,
      purchaseId: (fields[3] as List)?.cast<int>(),
    )..groceryList = fields[4] as GroceryList;
  }

  @override
  void write(BinaryWriter writer, PlannerRecord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.recipe)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.meal)
      ..writeByte(3)
      ..write(obj.purchaseId)
      ..writeByte(4)
      ..write(obj.groceryList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlannerRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
