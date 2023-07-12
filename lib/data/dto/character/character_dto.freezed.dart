// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) {
  return _CharacterDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  ShortOriginDto get origin => throw _privateConstructorUsedError;
  ShortLocationDto get location => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get episode => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDtoCopyWith<CharacterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDtoCopyWith<$Res> {
  factory $CharacterDtoCopyWith(
          CharacterDto value, $Res Function(CharacterDto) then) =
      _$CharacterDtoCopyWithImpl<$Res, CharacterDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String status,
      String species,
      String type,
      String gender,
      ShortOriginDto origin,
      ShortLocationDto location,
      String image,
      List<String> episode,
      String url,
      String created});

  $ShortOriginDtoCopyWith<$Res> get origin;
  $ShortLocationDtoCopyWith<$Res> get location;
}

/// @nodoc
class _$CharacterDtoCopyWithImpl<$Res, $Val extends CharacterDto>
    implements $CharacterDtoCopyWith<$Res> {
  _$CharacterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as ShortOriginDto,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ShortLocationDto,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

  @override
  @pragma('vm:prefer-inline')
  $ShortOriginDtoCopyWith<$Res> get origin {
    return $ShortOriginDtoCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortLocationDtoCopyWith<$Res> get location {
    return $ShortLocationDtoCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterDtoCopyWith<$Res>
    implements $CharacterDtoCopyWith<$Res> {
  factory _$$_CharacterDtoCopyWith(
          _$_CharacterDto value, $Res Function(_$_CharacterDto) then) =
      __$$_CharacterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String status,
      String species,
      String type,
      String gender,
      ShortOriginDto origin,
      ShortLocationDto location,
      String image,
      List<String> episode,
      String url,
      String created});

  @override
  $ShortOriginDtoCopyWith<$Res> get origin;
  @override
  $ShortLocationDtoCopyWith<$Res> get location;
}

/// @nodoc
class __$$_CharacterDtoCopyWithImpl<$Res>
    extends _$CharacterDtoCopyWithImpl<$Res, _$_CharacterDto>
    implements _$$_CharacterDtoCopyWith<$Res> {
  __$$_CharacterDtoCopyWithImpl(
      _$_CharacterDto _value, $Res Function(_$_CharacterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_$_CharacterDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as ShortOriginDto,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ShortLocationDto,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value._episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$_CharacterDto implements _CharacterDto {
  const _$_CharacterDto(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required final List<String> episode,
      required this.url,
      required this.created})
      : _episode = episode;

  factory _$_CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String species;
  @override
  final String type;
  @override
  final String gender;
  @override
  final ShortOriginDto origin;
  @override
  final ShortLocationDto location;
  @override
  final String image;
  final List<String> _episode;
  @override
  List<String> get episode {
    if (_episode is EqualUnmodifiableListView) return _episode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episode);
  }

  @override
  final String url;
  @override
  final String created;

  @override
  String toString() {
    return 'CharacterDto(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._episode, _episode) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(_episode),
      url,
      created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDtoCopyWith<_$_CharacterDto> get copyWith =>
      __$$_CharacterDtoCopyWithImpl<_$_CharacterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterDtoToJson(
      this,
    );
  }
}

abstract class _CharacterDto implements CharacterDto {
  const factory _CharacterDto(
      {required final int id,
      required final String name,
      required final String status,
      required final String species,
      required final String type,
      required final String gender,
      required final ShortOriginDto origin,
      required final ShortLocationDto location,
      required final String image,
      required final List<String> episode,
      required final String url,
      required final String created}) = _$_CharacterDto;

  factory _CharacterDto.fromJson(Map<String, dynamic> json) =
      _$_CharacterDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get species;
  @override
  String get type;
  @override
  String get gender;
  @override
  ShortOriginDto get origin;
  @override
  ShortLocationDto get location;
  @override
  String get image;
  @override
  List<String> get episode;
  @override
  String get url;
  @override
  String get created;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDtoCopyWith<_$_CharacterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortOriginDto _$ShortOriginDtoFromJson(Map<String, dynamic> json) {
  return _ShortOriginDto.fromJson(json);
}

/// @nodoc
mixin _$ShortOriginDto {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortOriginDtoCopyWith<ShortOriginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortOriginDtoCopyWith<$Res> {
  factory $ShortOriginDtoCopyWith(
          ShortOriginDto value, $Res Function(ShortOriginDto) then) =
      _$ShortOriginDtoCopyWithImpl<$Res, ShortOriginDto>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$ShortOriginDtoCopyWithImpl<$Res, $Val extends ShortOriginDto>
    implements $ShortOriginDtoCopyWith<$Res> {
  _$ShortOriginDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortOriginDtoCopyWith<$Res>
    implements $ShortOriginDtoCopyWith<$Res> {
  factory _$$_ShortOriginDtoCopyWith(
          _$_ShortOriginDto value, $Res Function(_$_ShortOriginDto) then) =
      __$$_ShortOriginDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_ShortOriginDtoCopyWithImpl<$Res>
    extends _$ShortOriginDtoCopyWithImpl<$Res, _$_ShortOriginDto>
    implements _$$_ShortOriginDtoCopyWith<$Res> {
  __$$_ShortOriginDtoCopyWithImpl(
      _$_ShortOriginDto _value, $Res Function(_$_ShortOriginDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_ShortOriginDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortOriginDto implements _ShortOriginDto {
  const _$_ShortOriginDto({required this.name, required this.url});

  factory _$_ShortOriginDto.fromJson(Map<String, dynamic> json) =>
      _$$_ShortOriginDtoFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ShortOriginDto(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortOriginDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortOriginDtoCopyWith<_$_ShortOriginDto> get copyWith =>
      __$$_ShortOriginDtoCopyWithImpl<_$_ShortOriginDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortOriginDtoToJson(
      this,
    );
  }
}

abstract class _ShortOriginDto implements ShortOriginDto {
  const factory _ShortOriginDto(
      {required final String name,
      required final String url}) = _$_ShortOriginDto;

  factory _ShortOriginDto.fromJson(Map<String, dynamic> json) =
      _$_ShortOriginDto.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ShortOriginDtoCopyWith<_$_ShortOriginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortLocationDto _$ShortLocationDtoFromJson(Map<String, dynamic> json) {
  return _ShortLocationDto.fromJson(json);
}

/// @nodoc
mixin _$ShortLocationDto {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortLocationDtoCopyWith<ShortLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortLocationDtoCopyWith<$Res> {
  factory $ShortLocationDtoCopyWith(
          ShortLocationDto value, $Res Function(ShortLocationDto) then) =
      _$ShortLocationDtoCopyWithImpl<$Res, ShortLocationDto>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$ShortLocationDtoCopyWithImpl<$Res, $Val extends ShortLocationDto>
    implements $ShortLocationDtoCopyWith<$Res> {
  _$ShortLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortLocationDtoCopyWith<$Res>
    implements $ShortLocationDtoCopyWith<$Res> {
  factory _$$_ShortLocationDtoCopyWith(
          _$_ShortLocationDto value, $Res Function(_$_ShortLocationDto) then) =
      __$$_ShortLocationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_ShortLocationDtoCopyWithImpl<$Res>
    extends _$ShortLocationDtoCopyWithImpl<$Res, _$_ShortLocationDto>
    implements _$$_ShortLocationDtoCopyWith<$Res> {
  __$$_ShortLocationDtoCopyWithImpl(
      _$_ShortLocationDto _value, $Res Function(_$_ShortLocationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_ShortLocationDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortLocationDto implements _ShortLocationDto {
  const _$_ShortLocationDto({required this.name, required this.url});

  factory _$_ShortLocationDto.fromJson(Map<String, dynamic> json) =>
      _$$_ShortLocationDtoFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ShortLocationDto(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortLocationDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortLocationDtoCopyWith<_$_ShortLocationDto> get copyWith =>
      __$$_ShortLocationDtoCopyWithImpl<_$_ShortLocationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortLocationDtoToJson(
      this,
    );
  }
}

abstract class _ShortLocationDto implements ShortLocationDto {
  const factory _ShortLocationDto(
      {required final String name,
      required final String url}) = _$_ShortLocationDto;

  factory _ShortLocationDto.fromJson(Map<String, dynamic> json) =
      _$_ShortLocationDto.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ShortLocationDtoCopyWith<_$_ShortLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
