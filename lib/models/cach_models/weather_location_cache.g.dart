// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_location_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherLocationCacheAdapter extends TypeAdapter<WeatherLocationCache> {
  @override
  final int typeId = 4;

  @override
  WeatherLocationCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherLocationCache(
      name: fields[0] as String,
      country: fields[1] as String,
      lat: fields[2] as double,
      lon: fields[3] as double,
      localTime: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherLocationCache obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lon)
      ..writeByte(4)
      ..write(obj.localTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLocationCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
