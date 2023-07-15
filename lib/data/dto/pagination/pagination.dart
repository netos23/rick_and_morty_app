import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data/dto/info/info.dart';


part 'pagination.freezed.dart';

part 'pagination.g.dart';

@Freezed(
  fromJson: true,
  genericArgumentFactories: true,
)
class Pagination<T> with _$Pagination<T> {
  factory Pagination({
    required Info info,
    required List<T> results,
  }) = _Pagination;

  factory Pagination.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) converter,
  ) =>
      _$PaginationFromJson(json, converter);
}
