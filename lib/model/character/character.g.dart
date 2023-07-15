// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Character _$$_CharacterFromJson(Map<String, dynamic> json) => _$_Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
      location:
          CharacterLocation.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      firstEpisodeName: json['firstEpisodeName'] as String?,
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$$_CharacterToJson(_$_Character instance) =>
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
      'firstEpisodeName': instance.firstEpisodeName,
      'url': instance.url,
      'created': instance.created,
    };

_$_Origin _$$_OriginFromJson(Map<String, dynamic> json) => _$_Origin(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_OriginToJson(_$_Origin instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$_CharacterLocation _$$_CharacterLocationFromJson(Map<String, dynamic> json) =>
    _$_CharacterLocation(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_CharacterLocationToJson(
        _$_CharacterLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
