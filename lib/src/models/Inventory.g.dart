// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Inventory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventoryAdapter extends TypeAdapter<Inventory> {
  @override
  final int typeId = 5;

  @override
  Inventory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Inventory(
      ingredient: fields[0] as Ingredient,
      quantity: fields[1] as int,
      datePurchased: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Inventory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ingredient)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.datePurchased);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
