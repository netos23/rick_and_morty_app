// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterList _$CharacterListFromJson(Map<String, dynamic> json) {
  return _CharacterList.fromJson(json);
}

/// @nodoc
mixin _$CharacterList {
  Info get info => throw _privateConstructorUsedError;
  List<Character> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterListCopyWith<CharacterList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterListCopyWith<$Res> {
  factory $CharacterListCopyWith(
          CharacterList value, $Res Function(CharacterList) then) =
      _$CharacterListCopyWithImpl<$Res, CharacterList>;
  @useResult
  $Res call({Info info, List<Character> results});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$CharacterListCopyWithImpl<$Res, $Val extends CharacterList>
    implements $CharacterListCopyWith<$Res> {
  _$CharacterListCopyWithImpl(this._value, this._then);

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
              as List<Character>,
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
abstract class _$$_CharacterListCopyWith<$Res>
    implements $CharacterListCopyWith<$Res> {
  factory _$$_CharacterListCopyWith(
          _$_CharacterList value, $Res Function(_$_CharacterList) then) =
      __$$_CharacterListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Info info, List<Character> results});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_CharacterListCopyWithImpl<$Res>
    extends _$CharacterListCopyWithImpl<$Res, _$_CharacterList>
    implements _$$_CharacterListCopyWith<$Res> {
  __$$_CharacterListCopyWithImpl(
      _$_CharacterList _value, $Res Function(_$_CharacterList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_CharacterList(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterList implements _CharacterList {
  const _$_CharacterList(
      {required this.info, required final List<Character> results})
      : _results = results;

  factory _$_CharacterList.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterListFromJson(json);

  @override
  final Info info;
  final List<Character> _results;
  @override
  List<Character> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'CharacterList(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterList &&
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
  _$$_CharacterListCopyWith<_$_CharacterList> get copyWith =>
      __$$_CharacterListCopyWithImpl<_$_CharacterList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterListToJson(
      this,
    );
  }
}

abstract class _CharacterList implements CharacterList {
  const factory _CharacterList(
      {required final Info info,
      required final List<Character> results}) = _$_CharacterList;

  factory _CharacterList.fromJson(Map<String, dynamic> json) =
      _$_CharacterList.fromJson;

  @override
  Info get info;
  @override
  List<Character> get results;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterListCopyWith<_$_CharacterList> get copyWith =>
      throw _privateConstructorUsedError;
}
