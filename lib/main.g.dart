// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WidgetDataAdapter extends TypeAdapter<Stickdata> {
  @override
  final int typeId = 0;

  @override
  Stickdata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stickdata(
      x: fields[0] as double,
      y: fields[1] as double,
      text: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Stickdata obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is WidgetDataAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}