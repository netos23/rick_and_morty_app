import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/location_client.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/util/pagination_builder.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({
    super.key,
    required this.locationClient,
  });

  final LocationClient locationClient;

  Future<(List<Location>, bool)> _loadLocations(int page) async {
    try {
      final pagination = await locationClient.getLocations(
        page: page,
      );

      return (pagination.results, pagination.info.next != null);
    } catch (e) {
      debugPrint(e.toString());
    }
    return (<Location>[], false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: PagePaginationBuilder<Location>(
          paginationCallback: _loadLocations,
          builder: (context, controller, snapshot) {
            final locations = snapshot.data;

            if (locations == null) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            return PageView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                final location = locations[index];
                return Column(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage: CachedNetworkImageProvider(
                          'https://avatars.mds.yandex.net/i?id=03de0d2774b19c136ca3a844fb0d8b7fdb4ee783-9151390-images-thumbs&n=13',
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${location.name}\n',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            TextSpan(
                              text: '${location.type} - ${location.dimension}',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: locations.length,
            );
          },
        ),
      ),
    );
  }
}
