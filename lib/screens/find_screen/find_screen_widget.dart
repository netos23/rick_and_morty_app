import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/components/char_card.dart';
import 'package:rick_and_morty/screens/components/search_widget.dart';
import 'find_screen_wm.dart';

// TODO: cover with documentation
/// Main widget for FindScreen module
class FindScreenWidget extends ElementaryWidget<IFindScreenWidgetModel> {
  const FindScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultFindScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFindScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: wm.colorScheme.onBackground,
        title: Text(
          "Rick and Morty",
          style: wm.textTheme.headlineLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchWidget(
            controller: wm.searchController,
          ),
          EntityStateNotifierBuilder(
              listenableEntityState: wm.charState,
              loadingBuilder: (context, _) {
                return const CircularProgressIndicator();
              },
              builder: (context, char) {
                return CharCard(
                  char: char,
                );
              })
        ],
      ),
    );
  }
}
