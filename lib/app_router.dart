import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app_router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
      AutoRoute(page: DetailsRoute.page),
      AutoRoute(page: HomeRoute.page, initial: true)
  ];
}