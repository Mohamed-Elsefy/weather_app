// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDailyCacheAdapter extends TypeAdapter<WeatherDailyCache> {
  @override
  final int typeId = 2;

  @override
  WeatherDailyCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDailyCache(
      date: fields[0] as String,
      minTemp: fields[1] as double,
      maxTemp: fields[2] as double,
      icon: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDailyCache obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.minTemp)
      ..writeByte(2)
      ..write(obj.maxTemp)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDailyCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
