import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/model/location.dart';
import 'location_screen_model.dart';
import 'location_screen_widget.dart';

abstract class ILocationScreenWidgetModel extends IWidgetModel {
  Future<Location> getLocation(int id);

}

LocationScreenWidgetModel defaultLocationScreenWidgetModelFactory(BuildContext context) {
  return LocationScreenWidgetModel(
    LocationScreenModel(
      errorHandler: context.read(),
      repo: context.read(),
    )
  );
}

class LocationScreenWidgetModel extends WidgetModel<LocationScreenWidget, LocationScreenModel>
    implements ILocationScreenWidgetModel {

  LocationScreenWidgetModel(LocationScreenModel model) : super(model);

  @override
  Future<Location> getLocation(int id) async{
    try{
      final data = await model.getLocation(id);
      return data;
    } catch (e){
      debugPrint(e.toString());
      rethrow;
    }
  }



}
