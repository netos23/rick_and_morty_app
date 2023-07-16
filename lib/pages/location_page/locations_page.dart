import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/pages/components/filter_button.dart';
import 'package:rick_and_morty/pages/components/filter_text_form.dart';
import 'package:rick_and_morty/pages/components/pagination_list.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/repositories/location_rep.dart';
import 'package:rick_and_morty/route/app_router.dart';

@RoutePage()
class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: RickAndMortyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Image.asset('assets/portal.png'),
            ),
            const Spacer(),
            Flexible(
                flex: 3,
                child: FilterTextForm(
                  onFieldSubmitted: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                )),
            const Spacer(),
            Expanded(
              flex: 12,
              child: PaginationList<Location>(
                  queries: {
                    "name": name,
                  },
                  sliverGridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.5),
                  cardBuilder: (context, location) {
                    return InkWell(
                      onTap: () {
                        AutoRouter.of(context)
                            .navigate(LocationRoute(location: location));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              location.name,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineSmall,
                            ),
                            Text(
                              location.type,
                              style: theme.textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  fetchData: LocationRepository().getLocationsByFilter),
            )
          ],
        ),
      ),
    );
  }
}
