// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherCacheAdapter extends TypeAdapter<WeatherCache> {
  @override
  final int typeId = 0;

  @override
  WeatherCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherCache(
      city: fields[0] as String,
      lang: fields[1] as String,
      cachedAt: fields[2] as DateTime,
      current: fields[3] as WeatherCurrentCache,
      daily: (fields[4] as List).cast<WeatherDailyCache>(),
      hourly: (fields[5] as List).cast<WeatherHourlyCache>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherCache obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.lang)
      ..writeByte(2)
      ..write(obj.cachedAt)
      ..writeByte(3)
      ..write(obj.current)
      ..writeByte(4)
      ..write(obj.daily)
      ..writeByte(5)
      ..write(obj.hourly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
