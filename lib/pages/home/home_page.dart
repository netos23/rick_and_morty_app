import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [
        CharacterTab(),
        EpisodeTab(),
        LocationTab(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.airplane_ticket_outlined,
              ),
            ),
          ],
        );
      },
    );
  }
}
