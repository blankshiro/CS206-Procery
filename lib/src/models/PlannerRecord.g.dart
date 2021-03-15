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
      recipeName: fields[0] as Recipe,
      date: fields[1] as String,
      meal: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlannerRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.recipeName)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.meal);
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
