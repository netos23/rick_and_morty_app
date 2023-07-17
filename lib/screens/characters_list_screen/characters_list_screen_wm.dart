import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/theme_provider.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'characters_list_screen_model.dart';
import 'characters_list_screen_widget.dart';

abstract class ICharactersListScreenWidgetModel extends IWidgetModel
    implements IThemeProvider {
Future<(List<Character> content, bool isMore)> loadMore(_);

}

CharactersListScreenWidgetModel defaultCharactersListScreenWidgetModelFactory(
    BuildContext context) {
  return CharactersListScreenWidgetModel(
    CharactersListScreenModel(
      errorHandler: context.read(),
      repo: context.read(),
    ),
  );
}

/// Default widget model for CharactersListScreenWidget
class CharactersListScreenWidgetModel
    extends WidgetModel<CharactersListScreenWidget, CharactersListScreenModel>
    with ThemeProvider
    implements ICharactersListScreenWidgetModel {
  CharactersListScreenWidgetModel(CharactersListScreenModel model)
      : super(model);

  @override
  Future<(List<Character>, bool)> loadMore(_) async{
    try{
      final data = await model.getNextPage();
      return data;
    } catch (e, stacktrace){
      debugPrintStack(stackTrace: stacktrace);
      rethrow;
    }
  }
}
