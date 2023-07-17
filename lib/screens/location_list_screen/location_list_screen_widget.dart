import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/location.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';
import 'package:rick_and_morty/screens/components/other_type_tile.dart';
import 'package:rick_and_morty/utils/pagination_builder.dart';
import 'location_list_screen_wm.dart';

@RoutePage()
class LocationListScreenWidget
    extends ElementaryWidget<ILocationListScreenWidgetModel> {
  const LocationListScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultLocationListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ILocationListScreenWidgetModel wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Локации"),
        ),
        body: PaginationBuilder<Location>(
          paginationCallback: wm.loadMore,
          builder: (context, controller, snapshot) {
            final locations = snapshot.data;
            if (locations == null || locations.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
                itemCount: locations.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return OtherTypeTile(
                    name: locations[index].name,
                    onTap: () => context.router
                        .navigate(LocationRoute(id: locations[index].id, preview: locations[index])),
                  );
                });
          },
        ),
    );
  }
}
