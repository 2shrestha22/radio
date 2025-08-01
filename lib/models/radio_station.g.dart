// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadioStation _$RadioStationFromJson(Map<String, dynamic> json) =>
    _RadioStation(
      id: json['id'] as String,
      name: json['name'] as String,
      streamUrl: json['streamUrl'] as String,
      frequency: (json['frequency'] as num?)?.toDouble(),
      address: json['address'] as String?,
      fav: json['fav'] as bool? ?? false,
      province: (json['province'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RadioStationToJson(_RadioStation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'streamUrl': instance.streamUrl,
      'frequency': instance.frequency,
      'address': instance.address,
      'fav': instance.fav,
      'province': instance.province,
    };
