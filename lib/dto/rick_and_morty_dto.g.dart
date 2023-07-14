// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_and_morty_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RickAndMortyDto<T> _$$_RickAndMortyDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_RickAndMortyDto<T>(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_RickAndMortyDtoToJson<T>(
  _$_RickAndMortyDto<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results.map(toJsonT).toList(),
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
