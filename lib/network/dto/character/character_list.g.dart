// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterList _$$_CharacterListFromJson(Map<String, dynamic> json) =>
    _$_CharacterList(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CharacterListToJson(_$_CharacterList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
