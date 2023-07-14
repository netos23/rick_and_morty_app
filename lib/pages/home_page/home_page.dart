import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/generate_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => TabNavigator();
}

class TabNavigator extends State<HomePage> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);

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
          body: IndexedStack(
            index: index,
            children: [
              Navigator(
                key: GenerateNavigator.locationNavigator[0],
                onGenerateRoute: GenerateNavigator.onGenerateRouteCharacter,
              ),
              Navigator(
                key: GenerateNavigator.locationNavigator[1],
                onGenerateRoute: GenerateNavigator.onGenerateRouteEpisode,
              ),
              Navigator(
                key: GenerateNavigator.locationNavigator[2],
                onGenerateRoute: GenerateNavigator.onGenerateRouteLocation,
              ),
            ],
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: index,
            onTap: (index) => _notifier.value = index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_library,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
