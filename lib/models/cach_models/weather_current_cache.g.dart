// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherCurrentCacheAdapter extends TypeAdapter<WeatherCurrentCache> {
  @override
  final int typeId = 1;

  @override
  WeatherCurrentCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherCurrentCache(
      tempC: fields[0] as double,
      conditionText: fields[1] as String,
      icon: fields[2] as String,
      humidity: fields[3] as int,
      windKph: fields[4] as double,
      feelsLikeC: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherCurrentCache obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.tempC)
      ..writeByte(1)
      ..write(obj.conditionText)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.humidity)
      ..writeByte(4)
      ..write(obj.windKph)
      ..writeByte(5)
      ..write(obj.feelsLikeC);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherCurrentCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
