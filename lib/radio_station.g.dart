// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RadioStationImpl _$$RadioStationImplFromJson(Map<String, dynamic> json) =>
    _$RadioStationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      frequency: (json['freq'] as num?)?.toDouble(),
      address: json['addr'] as String?,
      url: json['url'] as String,
      logo: json['logo'] as String?,
      province: (json['province'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RadioStationImplToJson(_$RadioStationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'freq': instance.frequency,
      'addr': instance.address,
      'url': instance.url,
      'logo': instance.logo,
      'province': instance.province,
    };
