// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hourly_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherHourlyCacheAdapter extends TypeAdapter<WeatherHourlyCache> {
  @override
  final int typeId = 3;

  @override
  WeatherHourlyCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherHourlyCache(
      time: fields[0] as String,
      tempC: fields[1] as double,
      icon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherHourlyCache obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.tempC)
      ..writeByte(2)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherHourlyCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
