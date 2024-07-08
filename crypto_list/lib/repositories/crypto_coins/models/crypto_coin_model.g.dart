// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinAdapter extends TypeAdapter<CryptoCoin> {
  @override
  final int typeId = 1;

  @override
  CryptoCoin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoin(
      name: fields[0] as String,
      USD: fields[1] as double,
      image_url: fields[4] as dynamic,
      hight24hour: fields[2] as double,
      low24hour: fields[3] as double,
      EUR: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoin obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.USD)
      ..writeByte(2)
      ..write(obj.hight24hour)
      ..writeByte(3)
      ..write(obj.low24hour)
      ..writeByte(4)
      ..write(obj.image_url)
      ..writeByte(5)
      ..write(obj.EUR);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
