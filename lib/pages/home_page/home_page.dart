import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/navigation/navigator/navigation_generator.dart';

typedef AppTheme = Function(bool);

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.theme,
  });

  final AppTheme theme;
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);

  bool darkTheme = false;

  set tab(int tab) {
    _notifier.value = tab;
  }

  int get tab => _notifier.value;

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (context, index, child) {
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
            onPressed: () {
              darkTheme = !darkTheme;
              widget.theme(darkTheme);
            },
            icon: const Icon(
              Icons.dark_mode,
            ),
          )),
          body: IndexedStack(
            index: index,
            children: [
              // TODO(netos23): dobavil
              Navigator(
                key: NavigationGenerator.inPageNavigation[0],
                onGenerateRoute: NavigationGenerator.onGenRouteCharacter,
              ),
              Navigator(
                key: NavigationGenerator.inPageNavigation[1],
                onGenerateRoute: NavigationGenerator.onGenRouteEpisode,
              ),
              Navigator(
                key: NavigationGenerator.inPageNavigation[2],
                onGenerateRoute: NavigationGenerator.onGenRouteLocation,
              ),
            ],
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: index,
            onTap: (index) => _notifier.value = index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.people_rounded,
                ),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map,
                ),
                label: 'Episodes',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_library,
                ),
                label: 'Location',
              ),
            ],
          ),
        );
      },
    );
  }
}
