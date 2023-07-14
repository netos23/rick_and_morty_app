// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationList _$LocationListFromJson(Map<String, dynamic> json) {
  return _LocationList.fromJson(json);
}

/// @nodoc
mixin _$LocationList {
  Info get info => throw _privateConstructorUsedError;
  List<Location> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationListCopyWith<LocationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationListCopyWith<$Res> {
  factory $LocationListCopyWith(
          LocationList value, $Res Function(LocationList) then) =
      _$LocationListCopyWithImpl<$Res, LocationList>;
  @useResult
  $Res call({Info info, List<Location> results});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$LocationListCopyWithImpl<$Res, $Val extends LocationList>
    implements $LocationListCopyWith<$Res> {
  _$LocationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoCopyWith<$Res> get info {
    return $InfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LocationListCopyWith<$Res>
    implements $LocationListCopyWith<$Res> {
  factory _$$_LocationListCopyWith(
          _$_LocationList value, $Res Function(_$_LocationList) then) =
      __$$_LocationListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Info info, List<Location> results});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_LocationListCopyWithImpl<$Res>
    extends _$LocationListCopyWithImpl<$Res, _$_LocationList>
    implements _$$_LocationListCopyWith<$Res> {
  __$$_LocationListCopyWithImpl(
      _$_LocationList _value, $Res Function(_$_LocationList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_LocationList(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationList implements _LocationList {
  const _$_LocationList(
      {required this.info, required final List<Location> results})
      : _results = results;

  factory _$_LocationList.fromJson(Map<String, dynamic> json) =>
      _$$_LocationListFromJson(json);

  @override
  final Info info;
  final List<Location> _results;
  @override
  List<Location> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'LocationList(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationList &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationListCopyWith<_$_LocationList> get copyWith =>
      __$$_LocationListCopyWithImpl<_$_LocationList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationListToJson(
      this,
    );
  }
}

abstract class _LocationList implements LocationList {
  const factory _LocationList(
      {required final Info info,
      required final List<Location> results}) = _$_LocationList;

  factory _LocationList.fromJson(Map<String, dynamic> json) =
      _$_LocationList.fromJson;

  @override
  Info get info;
  @override
  List<Location> get results;
  @override
  @JsonKey(ignore: true)
  _$$_LocationListCopyWith<_$_LocationList> get copyWith =>
      throw _privateConstructorUsedError;
}
