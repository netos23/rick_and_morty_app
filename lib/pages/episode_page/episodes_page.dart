import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/pages/components/filter_text_form.dart';
import 'package:rick_and_morty/pages/components/pagination_list.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/repositories/episode_rep.dart';
import 'package:rick_and_morty/route/app_router.dart';

@RoutePage()
class EpisodesPage extends StatefulWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: RickAndMortyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: Image.asset('assets/see.png'),
            ),
            const Spacer(),
            Flexible(
                flex: 3,
                child: FilterTextForm(
                  onFieldSubmitted: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                )),
            const Spacer(),
            Expanded(
              flex: 12,
              child: PaginationList<Episode>(
                  queries: {
                    "name": name,
                  },
                  sliverGridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.5),
                  cardBuilder: (context, episode) {
                    return InkWell(
                      onTap: () {
                        AutoRouter.of(context)
                            .navigate(EpisodeRoute(episode: episode));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              episode.name,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineSmall,
                            ),
                            Text(
                              episode.episode,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  fetchData: EpisodeRepository().getLocationsByFilter),
            )
          ],
        ),
      ),
    );
  }
}
