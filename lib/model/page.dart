import 'package:freezed_annotation/freezed_annotation.dart';
part 'page.freezed.dart';
part 'page.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class Page<T> with _$Page<T> {
  const factory Page({
    required Info info,
    required List<T> results,
  }) = _Page;

  factory Page.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$PageFromJson(json, fromJsonT);
}

@freezed()
abstract class Info with _$Info {
  const factory Info({
    required int count,
    required int pages,
    required String next,
    required String prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}