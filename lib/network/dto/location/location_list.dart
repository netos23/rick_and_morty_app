import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/network/dto/info/info.dart';
import 'package:rick_and_morty/network/model/location/location.dart';

part 'location_list.freezed.dart';

part 'location_list.g.dart';


@freezed
abstract class LocationList with _$LocationList {
  const factory LocationList({
    required Info info,
    required List<Location> results,
  }) = _LocationList;

  factory LocationList.fromJson(Map<String, dynamic> json) =>
      _$LocationListFromJson(json);
}