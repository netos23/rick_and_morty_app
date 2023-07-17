import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/data/model/location.dart';
import 'package:rick_and_morty/data/repo/location/location_repo.dart';


/// Default Elementary model for LocationScreen module
class LocationScreenModel extends ElementaryModel {
  LocationScreenModel({super.errorHandler, required this.repo});

  final LocationRepo repo;

  Future<Location> getLocation(int id) async{
    try{
      final dto = await repo.get(id);
      return Location.fromDto(dto);
    } catch(e, stacktrace){
      debugPrintStack(stackTrace: stacktrace);
      rethrow;
    }
  }
}
