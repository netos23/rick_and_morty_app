
import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_wrapper.g.dart';
part 'response_wrapper.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ResponseWrapper<T> with _$ResponseWrapper<T>{
  factory ResponseWrapper({
    required Info info,
  required List<T> results,
}) = _GetAllResponse;

  factory ResponseWrapper.fromJson(Map<String, dynamic> json, T Function(Object?) fromJson) => _$ResponseWrapperFromJson(json, fromJson);
}

@freezed
class Info with _$Info{
  factory Info({
    required int count,
    required int pages,
    String? next,
    String? prev,
}) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}