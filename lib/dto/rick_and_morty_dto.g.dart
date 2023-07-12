// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_and_morty_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RickAndMortyDto _$$_RickAndMortyDtoFromJson(Map<String, dynamic> json) =>
    _$_RickAndMortyDto(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RickAndMortyDtoToJson(_$_RickAndMortyDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

_$_Info _$$_InfoFromJson(Map<String, dynamic> json) => _$_Info(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$$_InfoToJson(_$_Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
