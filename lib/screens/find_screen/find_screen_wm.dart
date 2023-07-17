import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/theme_provider.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'find_screen_model.dart';
import 'find_screen_widget.dart';

abstract class IFindScreenWidgetModel extends IWidgetModel
    implements IThemeProvider {
  TextEditingController get searchController;

  EntityStateNotifier<Character> get charState;

  EntityStateNotifier<List<Episode>> get episodesState;
}

FindScreenWidgetModel defaultFindScreenWidgetModelFactory(
    BuildContext context) {
  return FindScreenWidgetModel(
    FindScreenModel(
      errorHandler: context.read(),
      clientRepo: context.read(),
      episodeRepo: context.read(),
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
    if(widget.id != null){
      searchController.text = widget.id.toString();
      final preview = widget.preview;
      if(preview != null){
        charState.loading(preview);
      }
    }
  }

  Character? currentChar;

  ///предыдущее значение контроллера
  String? prevText;

  Future<void> _search() async {

    ///если значение контроллера не изменилось, а метод вызвался
    ///(например при тапе на текстовое поле), запрос в репо
    ///не будет сделан
    if(searchController.value.text == prevText){
      return;
    }
    prevText = searchController.value.text;

    charState.loading(charState.value?.data);
    try {
      final text = searchController.value.text;
      if(text.isEmpty){
        return;
      }
      final char = await model.get(int.parse(text));
      charState.content(char);
      currentChar = char;
      _findEpisodes();
    } catch (e) {
      charState.error();
    }
  }



  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  final EntityStateNotifier<Character> charState = EntityStateNotifier();

  @override
  final EntityStateNotifier<List<Episode>> episodesState = EntityStateNotifier();

  Future<void> _findEpisodes() async {

    episodesState.loading(episodesState.value?.data);
    try{
      final char = currentChar;
      if(char == null || char.episodeIds.isEmpty){
        return;
      }
      final episodes = await model.findEpisodes(char.episodeIds.join(','));
      episodesState.content(episodes);
    } catch(e, stackTrace){
      episodesState.error();
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
