import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/location_client.dart';
import 'package:rick_and_morty/model/location.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({
    super.key,
    required this.locationClient,
    this.preview,
    required this.id,
  });

  final LocationClient locationClient;

  final Location? preview;
  final int id;

  Future<Location> _loadCharacter(int id) async {
    try {
      final location = await locationClient.getLocation(id);
      return location;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FutureBuilder(
        initialData: preview,
        future: _loadCharacter(id),
        builder: (context, snapshot) {
          final location = snapshot.data;
          if (location == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          return DividerTheme(
            data: const DividerThemeData(
              indent: 30,
              endIndent: 30,
            ),
            child: ListTileTheme.merge(
              contentPadding: const EdgeInsets.only(left: 30, right: 20),
              titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
              subtitleTextStyle: theme.textTheme.bodyMedium,
              textColor: theme.colorScheme.onBackground,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    title: Text(location.name),
                  ),
                  SliverList.list(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Informations',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Url'),
                        subtitle: Text(location.url),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Type'),
                        subtitle: Text(location.type),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Dimension'),
                        subtitle: Text(location.dimension),
                      ),
                      const Divider(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
