import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';

@RoutePage()
class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(

      lazyLoad: false,
      routes: const [
        CharTabPage(),
        LocationsTabPage(),
        EpisodeTabPage(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {

        return BottomNavigationBar(
          currentIndex: context.tabsRouter.activeIndex,
          onTap: context.tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'char',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'episode',
            ),
          ],
        );
      },
    );
  }
}
