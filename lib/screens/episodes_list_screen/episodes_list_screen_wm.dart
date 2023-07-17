import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'episodes_list_screen_model.dart';
import 'episodes_list_screen_widget.dart';

abstract class IEpisodesListScreenWidgetModel extends IWidgetModel {
  Future<(List<Episode>, bool)> loadMore(_);
}

EpisodesListScreenWidgetModel defaultEpisodesListScreenWidgetModelFactory(BuildContext context) {
  return EpisodesListScreenWidgetModel(
    EpisodesListScreenModel(
      errorHandler: context.read(),
      repo: context.read(),
    )
  );
}


/// Default widget model for EpisodesListScreenWidget
class EpisodesListScreenWidgetModel extends WidgetModel<EpisodesListScreenWidget, EpisodesListScreenModel>
    implements IEpisodesListScreenWidgetModel {

  EpisodesListScreenWidgetModel(EpisodesListScreenModel model) : super(model);

  @override
  Future<(List<Episode>, bool)> loadMore(_) async {
    try{
      final data = await model.getNextPage();
      return data;
    } catch (e){
      debugPrint(e.toString());
      rethrow;
    }
  }
}
