import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/location/location.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';


@RoutePage()
class LocationItemPage extends StatefulWidget {
  const LocationItemPage({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  State<LocationItemPage> createState() => _LocationItemPageState();
}

class _LocationItemPageState extends State<LocationItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: ArrowBackTile(),),
            SliverList.list(
              children: [
                Text(widget.location.name),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
