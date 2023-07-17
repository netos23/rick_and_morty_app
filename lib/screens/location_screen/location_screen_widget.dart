import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/location.dart';
import 'package:rick_and_morty/screens/location_screen/widgets/location_card.dart';
import 'location_screen_wm.dart';

@RoutePage()
class LocationScreenWidget
    extends ElementaryWidget<ILocationScreenWidgetModel> {
  const LocationScreenWidget({
    required this.id,
    this.preview,
    Key? key,
    WidgetModelFactory wmFactory = defaultLocationScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final int id;
  final Location? preview;

  @override
  Widget build(ILocationScreenWidgetModel wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Location"),
        ),
        body: FutureBuilder(
          initialData: preview,
          future: wm.getLocation(id),
          builder: (context, snapshot) {
            final value = snapshot.data;
            if (value == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomScrollView(slivers: [
              LocationCard(location: value),
              const SliverToBoxAdapter(
                child: Text("Здесь должен быть FutureBuilder для резидентов"),
              ),
            ]);
          },
        ));
  }
}
