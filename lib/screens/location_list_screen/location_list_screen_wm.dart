import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/theme_provider.dart';
import 'package:rick_and_morty/data/model/location.dart';
import 'location_list_screen_model.dart';
import 'location_list_screen_widget.dart';

abstract class ILocationListScreenWidgetModel extends IWidgetModel
    implements IThemeProvider {
  Future<(List<Location> content, bool isMore)> loadMore(_);
}

LocationListScreenWidgetModel defaultLocationListScreenWidgetModelFactory(
    BuildContext context) {
  return LocationListScreenWidgetModel(LocationListScreenModel(
    errorHandler: context.read(),
    repo: context.read(),
  ));
}

/// Default widget model for LocationListScreenWidget
class LocationListScreenWidgetModel
    extends WidgetModel<LocationListScreenWidget, LocationListScreenModel>
    with ThemeProvider
    implements ILocationListScreenWidgetModel {
  LocationListScreenWidgetModel(LocationListScreenModel model) : super(model);

  @override
  Future<(List<Location>, bool)> loadMore(_) async {
    try{
      final data = await model.getNextPage();
      return data;
    } catch(e){
      debugPrint(e.toString());
      rethrow;
    }
  }
}
