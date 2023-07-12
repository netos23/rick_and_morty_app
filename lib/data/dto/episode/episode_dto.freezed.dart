// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeDto _$EpisodeDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeDto {
  int get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; //чтобы не бесился, что не camelCase
// ignore: non_constant_identifier_names
  String get air_date => throw _privateConstructorUsedError;
  String get episode => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeDtoCopyWith<EpisodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeDtoCopyWith<$Res> {
  factory $EpisodeDtoCopyWith(
          EpisodeDto value, $Res Function(EpisodeDto) then) =
      _$EpisodeDtoCopyWithImpl<$Res, EpisodeDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String air_date,
      String episode,
      String url,
      String created});
}

/// @nodoc
class _$EpisodeDtoCopyWithImpl<$Res, $Val extends EpisodeDto>
    implements $EpisodeDtoCopyWith<$Res> {
  _$EpisodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? air_date = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      air_date: null == air_date
          ? _value.air_date
          : air_date // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeDtoCopyWith<$Res>
    implements $EpisodeDtoCopyWith<$Res> {
  factory _$$_EpisodeDtoCopyWith(
          _$_EpisodeDto value, $Res Function(_$_EpisodeDto) then) =
      __$$_EpisodeDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String air_date,
      String episode,
      String url,
      String created});
}

/// @nodoc
class __$$_EpisodeDtoCopyWithImpl<$Res>
    extends _$EpisodeDtoCopyWithImpl<$Res, _$_EpisodeDto>
    implements _$$_EpisodeDtoCopyWith<$Res> {
  __$$_EpisodeDtoCopyWithImpl(
      _$_EpisodeDto _value, $Res Function(_$_EpisodeDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? air_date = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_$_EpisodeDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      air_date: null == air_date
          ? _value.air_date
          : air_date // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeDto implements _EpisodeDto {
  const _$_EpisodeDto(
      {required this.id,
      required this.name,
      required this.air_date,
      required this.episode,
      required this.url,
      required this.created});

  factory _$_EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
//чтобы не бесился, что не camelCase
// ignore: non_constant_identifier_names
  @override
  final String air_date;
  @override
  final String episode;
  @override
  final String url;
  @override
  final String created;

  @override
  String toString() {
    return 'EpisodeDto(id: $id, name: $name, air_date: $air_date, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.air_date, air_date) ||
                other.air_date == air_date) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, air_date, episode, url, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeDtoCopyWith<_$_EpisodeDto> get copyWith =>
      __$$_EpisodeDtoCopyWithImpl<_$_EpisodeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeDtoToJson(
      this,
    );
  }
}

abstract class _EpisodeDto implements EpisodeDto {
  const factory _EpisodeDto(
      {required final int id,
      required final String name,
      required final String air_date,
      required final String episode,
      required final String url,
      required final String created}) = _$_EpisodeDto;

  factory _EpisodeDto.fromJson(Map<String, dynamic> json) =
      _$_EpisodeDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override //чтобы не бесился, что не camelCase
// ignore: non_constant_identifier_names
  String get air_date;
  @override
  String get episode;
  @override
  String get url;
  @override
  String get created;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeDtoCopyWith<_$_EpisodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
