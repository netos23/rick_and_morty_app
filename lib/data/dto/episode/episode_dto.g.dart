// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeDto _$$_EpisodeDtoFromJson(Map<String, dynamic> json) =>
    _$_EpisodeDto(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['air_date'] as String,
      episode: json['episode'] as String,
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$$_EpisodeDtoToJson(_$_EpisodeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };
