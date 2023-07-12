// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDto _$$_CharacterDtoFromJson(Map<String, dynamic> json) =>
    _$_CharacterDto(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: ShortOriginDto.fromJson(json['origin'] as Map<String, dynamic>),
      location:
          ShortLocationDto.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$$_CharacterDtoToJson(_$_CharacterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };

_$_ShortOriginDto _$$_ShortOriginDtoFromJson(Map<String, dynamic> json) =>
    _$_ShortOriginDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_ShortOriginDtoToJson(_$_ShortOriginDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$_ShortLocationDto _$$_ShortLocationDtoFromJson(Map<String, dynamic> json) =>
    _$_ShortLocationDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_ShortLocationDtoToJson(_$_ShortLocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
