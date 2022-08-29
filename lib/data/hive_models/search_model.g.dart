// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchAdapter extends TypeAdapter<Search> {
  @override
  final int typeId = 0;

  @override
  Search read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Search()
      ..location = fields[0] as String
      ..start = fields[1] as DateTime
      ..end = fields[2] as DateTime
      ..rooms = fields[3] as int
      ..adults = fields[4] as int
      ..kids = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, Search obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.rooms)
      ..writeByte(4)
      ..write(obj.adults)
      ..writeByte(5)
      ..write(obj.kids);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
