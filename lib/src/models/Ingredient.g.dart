// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 1;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      name: fields[0] as String,
      description: fields[1] as String,
      expiryDays: fields[3] as int,
      price: fields[4] as double,
      standardQ: fields[5] as int,
      measurementType: fields[6] as String,
      image: fields[7] as String,
      divide: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.expiryDays)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.standardQ)
      ..writeByte(6)
      ..write(obj.measurementType)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.divide);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
