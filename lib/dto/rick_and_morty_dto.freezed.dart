// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rick_and_morty_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RickAndMortyDto<T> _$RickAndMortyDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _RickAndMortyDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$RickAndMortyDto<T> {
  Info get info => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RickAndMortyDtoCopyWith<T, RickAndMortyDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RickAndMortyDtoCopyWith<T, $Res> {
  factory $RickAndMortyDtoCopyWith(
          RickAndMortyDto<T> value, $Res Function(RickAndMortyDto<T>) then) =
      _$RickAndMortyDtoCopyWithImpl<T, $Res, RickAndMortyDto<T>>;
  @useResult
  $Res call({Info info, List<T> results});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$RickAndMortyDtoCopyWithImpl<T, $Res, $Val extends RickAndMortyDto<T>>
    implements $RickAndMortyDtoCopyWith<T, $Res> {
  _$RickAndMortyDtoCopyWithImpl(this._value, this._then);

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
              as List<T>,
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
abstract class _$$_RickAndMortyDtoCopyWith<T, $Res>
    implements $RickAndMortyDtoCopyWith<T, $Res> {
  factory _$$_RickAndMortyDtoCopyWith(_$_RickAndMortyDto<T> value,
          $Res Function(_$_RickAndMortyDto<T>) then) =
      __$$_RickAndMortyDtoCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({Info info, List<T> results});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_RickAndMortyDtoCopyWithImpl<T, $Res>
    extends _$RickAndMortyDtoCopyWithImpl<T, $Res, _$_RickAndMortyDto<T>>
    implements _$$_RickAndMortyDtoCopyWith<T, $Res> {
  __$$_RickAndMortyDtoCopyWithImpl(
      _$_RickAndMortyDto<T> _value, $Res Function(_$_RickAndMortyDto<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_RickAndMortyDto<T>(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_RickAndMortyDto<T> implements _RickAndMortyDto<T> {
  const _$_RickAndMortyDto({required this.info, required final List<T> results})
      : _results = results;

  factory _$_RickAndMortyDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_RickAndMortyDtoFromJson(json, fromJsonT);

  @override
  final Info info;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'RickAndMortyDto<$T>(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RickAndMortyDto<T> &&
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
  _$$_RickAndMortyDtoCopyWith<T, _$_RickAndMortyDto<T>> get copyWith =>
      __$$_RickAndMortyDtoCopyWithImpl<T, _$_RickAndMortyDto<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_RickAndMortyDtoToJson<T>(this, toJsonT);
  }
}

abstract class _RickAndMortyDto<T> implements RickAndMortyDto<T> {
  const factory _RickAndMortyDto(
      {required final Info info,
      required final List<T> results}) = _$_RickAndMortyDto<T>;

  factory _RickAndMortyDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_RickAndMortyDto<T>.fromJson;

  @override
  Info get info;
  @override
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$_RickAndMortyDtoCopyWith<T, _$_RickAndMortyDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

Info _$InfoFromJson(Map<String, dynamic> json) {
  return _Info.fromJson(json);
}

/// @nodoc
mixin _$Info {
  int get count => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoCopyWith<Info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoCopyWith<$Res> {
  factory $InfoCopyWith(Info value, $Res Function(Info) then) =
      _$InfoCopyWithImpl<$Res, Info>;
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class _$InfoCopyWithImpl<$Res, $Val extends Info>
    implements $InfoCopyWith<$Res> {
  _$InfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoCopyWith<$Res> implements $InfoCopyWith<$Res> {
  factory _$$_InfoCopyWith(_$_Info value, $Res Function(_$_Info) then) =
      __$$_InfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class __$$_InfoCopyWithImpl<$Res> extends _$InfoCopyWithImpl<$Res, _$_Info>
    implements _$$_InfoCopyWith<$Res> {
  __$$_InfoCopyWithImpl(_$_Info _value, $Res Function(_$_Info) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_$_Info(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Info implements _Info {
  const _$_Info(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory _$_Info.fromJson(Map<String, dynamic> json) => _$$_InfoFromJson(json);

  @override
  final int count;
  @override
  final int pages;
  @override
  final String? next;
  @override
  final String? prev;

  @override
  String toString() {
    return 'Info(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Info &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, pages, next, prev);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoCopyWith<_$_Info> get copyWith =>
      __$$_InfoCopyWithImpl<_$_Info>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfoToJson(
      this,
    );
  }
}

abstract class _Info implements Info {
  const factory _Info(
      {required final int count,
      required final int pages,
      required final String? next,
      required final String? prev}) = _$_Info;

  factory _Info.fromJson(Map<String, dynamic> json) = _$_Info.fromJson;

  @override
  int get count;
  @override
  int get pages;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  @JsonKey(ignore: true)
  _$$_InfoCopyWith<_$_Info> get copyWith => throw _privateConstructorUsedError;
}
