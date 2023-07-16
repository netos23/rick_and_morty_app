import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/service.dart';
import 'package:rick_and_morty/model/location/location.dart';

@RoutePage()
class LocationPage extends StatefulWidget {
  const LocationPage({
    super.key,
    this.preview,
    required this.id,
  });

  final Location? preview;
  final int id;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  AppClient get appClient => context.read();

  Future<Location> _loadCharacter(int id) async {
    try {
      final location = await appClient.getLocation(id);
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
        initialData: widget.preview,
        future: _loadCharacter(widget.id),
        builder: (context, snapshot) {
          final location = snapshot.data;
          if (location == null) {
            return const Center(
              child: CircularProgressIndicator(),
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