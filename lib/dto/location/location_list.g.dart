// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationList _$$_LocationListFromJson(Map<String, dynamic> json) =>
    _$_LocationList(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LocationListToJson(_$_LocationList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
