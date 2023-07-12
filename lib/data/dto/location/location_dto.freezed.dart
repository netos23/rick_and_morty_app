// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) {
  return _LocationDto.fromJson(json);
}

/// @nodoc
mixin _$LocationDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get dimension => throw _privateConstructorUsedError;
  List<String> get residents => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDtoCopyWith<LocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDtoCopyWith<$Res> {
  factory $LocationDtoCopyWith(
          LocationDto value, $Res Function(LocationDto) then) =
      _$LocationDtoCopyWithImpl<$Res, LocationDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String dimension,
      List<String> residents,
      String url,
      String created});
}

/// @nodoc
class _$LocationDtoCopyWithImpl<$Res, $Val extends LocationDto>
    implements $LocationDtoCopyWith<$Res> {
  _$LocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? dimension = null,
    Object? residents = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      dimension: null == dimension
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String,
      residents: null == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$_LocationDtoCopyWith<$Res>
    implements $LocationDtoCopyWith<$Res> {
  factory _$$_LocationDtoCopyWith(
          _$_LocationDto value, $Res Function(_$_LocationDto) then) =
      __$$_LocationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String dimension,
      List<String> residents,
      String url,
      String created});
}

/// @nodoc
class __$$_LocationDtoCopyWithImpl<$Res>
    extends _$LocationDtoCopyWithImpl<$Res, _$_LocationDto>
    implements _$$_LocationDtoCopyWith<$Res> {
  __$$_LocationDtoCopyWithImpl(
      _$_LocationDto _value, $Res Function(_$_LocationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? dimension = null,
    Object? residents = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_$_LocationDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      dimension: null == dimension
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String,
      residents: null == residents
          ? _value._residents
          : residents // ignore: cast_nullable_to_non_nullable
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
class _$_LocationDto implements _LocationDto {
  const _$_LocationDto(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension,
      required final List<String> residents,
      required this.url,
      required this.created})
      : _residents = residents;

  factory _$_LocationDto.fromJson(Map<String, dynamic> json) =>
      _$$_LocationDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String dimension;
  final List<String> _residents;
  @override
  List<String> get residents {
    if (_residents is EqualUnmodifiableListView) return _residents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_residents);
  }

  @override
  final String url;
  @override
  final String created;

  @override
  String toString() {
    return 'LocationDto(id: $id, name: $name, type: $type, dimension: $dimension, residents: $residents, url: $url, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension) &&
            const DeepCollectionEquality()
                .equals(other._residents, _residents) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, dimension,
      const DeepCollectionEquality().hash(_residents), url, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDtoCopyWith<_$_LocationDto> get copyWith =>
      __$$_LocationDtoCopyWithImpl<_$_LocationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationDtoToJson(
      this,
    );
  }
}

abstract class _LocationDto implements LocationDto {
  const factory _LocationDto(
      {required final int id,
      required final String name,
      required final String type,
      required final String dimension,
      required final List<String> residents,
      required final String url,
      required final String created}) = _$_LocationDto;

  factory _LocationDto.fromJson(Map<String, dynamic> json) =
      _$_LocationDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get dimension;
  @override
  List<String> get residents;
  @override
  String get url;
  @override
  String get created;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDtoCopyWith<_$_LocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
