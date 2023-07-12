import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/theme_provider.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'find_screen_model.dart';
import 'find_screen_widget.dart';

abstract class IFindScreenWidgetModel extends IWidgetModel
    implements IThemeProvider {
  TextEditingController get searchController;

  EntityStateNotifier<Character> get charState;
}

FindScreenWidgetModel defaultFindScreenWidgetModelFactory(
    BuildContext context) {
  return FindScreenWidgetModel(
    FindScreenModel(
      context.read(),
      context.read(),
    ),
  );
}

// TODO: cover with documentation
/// Default widget model for FindScreenWidget
class FindScreenWidgetModel
    extends WidgetModel<FindScreenWidget, FindScreenModel>
    with ThemeProvider
    implements IFindScreenWidgetModel {
  FindScreenWidgetModel(FindScreenModel model) : super(model);

  @override
  final TextEditingController searchController = TextEditingController();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    searchController.addListener(_search);
  }

  Future<void> _search() async {
    charState.loading(charState.value?.data);
    try {
      final text = searchController.value.text;
      if(text.isEmpty){
        return;
      }
      final char = await model.get(int.parse(text));
      charState.content(char);
    } catch (e) {
      charState.error();
      debugPrint("(");
    }
  }



  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement charState
  EntityStateNotifier<Character> charState = EntityStateNotifier();
}
