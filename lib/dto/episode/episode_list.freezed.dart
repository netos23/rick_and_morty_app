// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeList _$EpisodeListFromJson(Map<String, dynamic> json) {
  return _EpisodeList.fromJson(json);
}

/// @nodoc
mixin _$EpisodeList {
  Info get info => throw _privateConstructorUsedError;
  List<Episode> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeListCopyWith<EpisodeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeListCopyWith<$Res> {
  factory $EpisodeListCopyWith(
          EpisodeList value, $Res Function(EpisodeList) then) =
      _$EpisodeListCopyWithImpl<$Res, EpisodeList>;
  @useResult
  $Res call({Info info, List<Episode> results});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$EpisodeListCopyWithImpl<$Res, $Val extends EpisodeList>
    implements $EpisodeListCopyWith<$Res> {
  _$EpisodeListCopyWithImpl(this._value, this._then);

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
              as List<Episode>,
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
abstract class _$$_EpisodeListCopyWith<$Res>
    implements $EpisodeListCopyWith<$Res> {
  factory _$$_EpisodeListCopyWith(
          _$_EpisodeList value, $Res Function(_$_EpisodeList) then) =
      __$$_EpisodeListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Info info, List<Episode> results});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_EpisodeListCopyWithImpl<$Res>
    extends _$EpisodeListCopyWithImpl<$Res, _$_EpisodeList>
    implements _$$_EpisodeListCopyWith<$Res> {
  __$$_EpisodeListCopyWithImpl(
      _$_EpisodeList _value, $Res Function(_$_EpisodeList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_EpisodeList(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeList implements _EpisodeList {
  const _$_EpisodeList(
      {required this.info, required final List<Episode> results})
      : _results = results;

  factory _$_EpisodeList.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeListFromJson(json);

  @override
  final Info info;
  final List<Episode> _results;
  @override
  List<Episode> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'EpisodeList(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeList &&
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
  _$$_EpisodeListCopyWith<_$_EpisodeList> get copyWith =>
      __$$_EpisodeListCopyWithImpl<_$_EpisodeList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeListToJson(
      this,
    );
  }
}

abstract class _EpisodeList implements EpisodeList {
  const factory _EpisodeList(
      {required final Info info,
      required final List<Episode> results}) = _$_EpisodeList;

  factory _EpisodeList.fromJson(Map<String, dynamic> json) =
      _$_EpisodeList.fromJson;

  @override
  Info get info;
  @override
  List<Episode> get results;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeListCopyWith<_$_EpisodeList> get copyWith =>
      throw _privateConstructorUsedError;
}
