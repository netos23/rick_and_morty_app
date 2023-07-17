import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/location.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTileTheme.merge(
      titleTextStyle: textTheme.bodyLarge,
      subtitleTextStyle: textTheme.bodyMedium,
      child: SliverList.list(
        children: [

          ListTile(
            title: const Text("name"),
            subtitle: Text(location.name),
          ),
          ListTile(
            title: const Text("dimension"),
            subtitle: Text(location.dimension),
          ),
          ListTile(
            title: const Text("type"),
            subtitle: Text(location.type),
          ),
          ListTile(
            title: const Text("created"),
            subtitle: Text(location.created),
          ),
        ],
      ),
    );
  }
}
