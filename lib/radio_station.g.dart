// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RadioStationImpl _$$RadioStationImplFromJson(Map<String, dynamic> json) =>
    _$RadioStationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      streamUrl: json['streamUrl'] as String,
      frequency: json['frequency'] as String?,
      frequencyType: json['frequencyType'] as String?,
      address: json['address'] as String?,
      fav: json['fav'] as bool? ?? false,
    );

Map<String, dynamic> _$$RadioStationImplToJson(_$RadioStationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'streamUrl': instance.streamUrl,
      'frequency': instance.frequency,
      'frequencyType': instance.frequencyType,
      'address': instance.address,
      'fav': instance.fav,
    };
