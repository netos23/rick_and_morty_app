import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'episode_screen_model.dart';
import 'episode_screen_widget.dart';

abstract class IEpisodeScreenWidgetModel extends IWidgetModel {
}

EpisodeScreenWidgetModel defaultEpisodeScreenWidgetModelFactory(BuildContext context) {
  return EpisodeScreenWidgetModel(
    EpisodeScreenModel(
      context.read(),
    )
  );
}

/// Default widget model for EpisodeScreenWidget
class EpisodeScreenWidgetModel extends WidgetModel<EpisodeScreenWidget, EpisodeScreenModel>
    implements IEpisodeScreenWidgetModel {

  EpisodeScreenWidgetModel(EpisodeScreenModel model) : super(model);
}
