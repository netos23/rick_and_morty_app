import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'episode_screen_wm.dart';
//нет времени нормально делать, заглушка для навигации
@RoutePage()
class EpisodeScreenWidget extends ElementaryWidget<IEpisodeScreenWidgetModel> {
  const EpisodeScreenWidget(this.episode, {
    Key? key,
    WidgetModelFactory wmFactory = defaultEpisodeScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final Episode episode;
  @override
  Widget build(IEpisodeScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Эпизод"),
      ),
      body: Center(
        child: Text(episode.name),
      ),
    );
  }
}
