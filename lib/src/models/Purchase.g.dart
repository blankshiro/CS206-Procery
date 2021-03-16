// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Purchase.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseAdapter extends TypeAdapter<Purchase> {
  @override
  final int typeId = 3;

  @override
  Purchase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Purchase(
      ingredient: fields[0] as Ingredient,
      quantity: fields[1] as int,
      datePurchased: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Purchase obj) {
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
      other is PurchaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}