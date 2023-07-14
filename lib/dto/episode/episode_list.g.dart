// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeList _$$_EpisodeListFromJson(Map<String, dynamic> json) =>
    _$_EpisodeList(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EpisodeListToJson(_$_EpisodeList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
