import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/route/app_router.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CharactersRoute(),
        LocationsRoute(),
        EpisodesRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Character'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Locations'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Episodes'),
            ],
          ),
        );
      },
    );
  }
}
