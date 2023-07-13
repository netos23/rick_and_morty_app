import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.freezed.dart';
part 'info.g.dart';

@freezed
class Info with _$Info {
    factory Info({
      required int count,
      required int pages,
      required String? next,
      required String? prev,
}) = _Info;

    factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}