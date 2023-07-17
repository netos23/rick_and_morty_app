import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';

class CharCard extends StatelessWidget {
  const CharCard({Key? key, required this.char}) : super(key: key);

  final Character char;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final colorScheme = Theme.of(context).colorScheme;

    final int? origin = char.origin.id;
    final int? location = char.location.id;
    return ListTileTheme.merge(
      titleTextStyle: textTheme.bodyLarge,
      subtitleTextStyle: textTheme.bodyMedium,
      tileColor: colorScheme.background,
      child: SliverList.list(
        children: [
          Hero(
            tag: char.id,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: char.image,
            ),
          ),
          ListTile(
            title: const Text("name"),
            subtitle: Text(char.name),
          ),
          _CharStatus(
            status: char.status,
          ),
          ListTile(
            title: const Text("species"),
            subtitle: Text(char.species),
          ),
          ListTile(
            title: const Text("gender"),
            subtitle: Text(char.gender),
          ),
          if (char.type.isNotEmpty)
            ListTile(
              title: const Text("type"),
              subtitle: Text(char.type),
            ),
          ListTile(
            title: const Text("origin"),
            subtitle: Text(char.origin.name),
            trailing:
                origin == null ? null : const Icon(Icons.navigate_next_rounded),
            onTap: () =>
                origin == null ? null : _navigateToLocation(context, origin),
          ),
          ListTile(
            title: const Text("located"),
            subtitle: Text(char.location.name),
            trailing: location == null
                ? null
                : const Icon(Icons.navigate_next_rounded),
            onTap: () => location == null
                ? null
                : _navigateToLocation(context, location),
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToLocation(BuildContext context, int id) {
    context.tabsRouter.setActiveIndex(1);
    return context.tabsRouter.navigate(LocationRoute(id: id));
  }
}

class _CharStatus extends StatelessWidget {
  const _CharStatus({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color color;
    switch (status) {
      case "Alive":
        color = colorScheme.secondary;
        break;
      case "Dead":
        color = colorScheme.error;
        break;
      default:
        color = colorScheme.tertiary;
        break;
    }

    return ListTile(
      title: const Text("status"),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Text(status),
        ],
      ),
    );
  }
}
