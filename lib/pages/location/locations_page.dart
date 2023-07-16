import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/data/repository/location_repository.dart';
import 'package:rick_and_morty/network/model/location/location.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/router/app_router.dart';

@RoutePage()
class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final LocationRepository _locationRepository = DioUtil().locationRepository;

  Future<Pagination<Location>> getLocations() async {
    final res = await _locationRepository.getLocations();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder<Pagination<Location>>(
          future: getLocations(),
          builder: (context, snapshot) {
            final locations = snapshot.data;
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (locations == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Image.asset('assets/images/planet_logo.png'),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: locations.results.length,
                      (BuildContext context, int index) {
                        final location = locations.results[index];
                        return GestureDetector(
                          onTap: () {
                            context.router.push(
                              LocationItemPageRoute(
                                id: location.id,
                                location: location,
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            elevation: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ListTile(
                                title: Text(
                                  location.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(location.type),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
