import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

@RoutePage()
class EpisodeItemPage extends StatefulWidget {
  const EpisodeItemPage({Key? key, required this.episode}) : super(key: key);

  final Episode episode;

  @override
  State<EpisodeItemPage> createState() => _EpisodeItemPageState();
}

class _EpisodeItemPageState extends State<EpisodeItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: ArrowBackTile(),),
            SliverList.list(children: [
              Text(widget.episode.name),
            ],),
          ],
        ),
      ),
    );
  }
}
