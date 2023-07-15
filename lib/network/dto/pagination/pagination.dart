import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/network/dto/info/info.dart';


part 'pagination.freezed.dart';
part 'pagination.g.dart';

@Freezed(genericArgumentFactories: true)
class Pagination<T> with _$Pagination<T> {
  factory Pagination({required Info info, required List<T> results}) =
      _Pagination;

  factory Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationFromJson(json, fromJsonT);
}
