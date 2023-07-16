import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/repository/location_repository.dart';
import 'package:rick_and_morty/network/model/location/location.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

@RoutePage()
class LocationItemPage extends StatefulWidget {
  const LocationItemPage({
    super.key,
    required this.id,
    this.location,
  });

  final int id;
  final Location? location;

  @override
  State<LocationItemPage> createState() => _LocationItemPageState();
}

class _LocationItemPageState extends State<LocationItemPage> {
  final LocationRepository _locationRepository = DioUtil().locationRepository;

  @override
  void initState() {
    super.initState();
  }

  Future<Location> getLocation() async {
    final res = await _locationRepository.getLocation(widget.id);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder<Location>(
          initialData: widget.location,
          future: getLocation(),
          builder: (context, snapshot) {
            final location = snapshot.data;
            if (location != null) {
              return Center (child: Text(location.name),);
            }
            return Center(child: Text(snapshot.error.toString()));
          },
        ),
      ),
    );
  }
}
