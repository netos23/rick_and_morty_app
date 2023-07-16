import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'app_router.dart';
import 'app_router.gr.dart';

@RoutePage(name: 'BottomNavigationBarRoute')
class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var _selectedTab = 0;


  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),

      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items:  [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Main"),
              selectedColor: Colors.blue,
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.list),
              title: const Text("Episodes"),
              selectedColor: Colors.blue,
            ),
          ],
        );
      },
    );
  }
}