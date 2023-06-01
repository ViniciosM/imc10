// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcHiveModelAdapter extends TypeAdapter<ImcHiveModel> {
  @override
  final int typeId = 1;

  @override
  ImcHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcHiveModel()
      ..height = fields[0] as double
      ..weight = fields[1] as double;
  }

  @override
  void write(BinaryWriter writer, ImcHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
