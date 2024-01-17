import 'package:go_router/go_router.dart';
import 'package:pokemon_challenge/features/details/view/details_page.dart';
import 'package:pokemon_challenge/features/home/view/home_page.dart';

class AppRouter {
  AppRouter._();

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static const String detailsNamed = 'details';
  static const String detailsPath = '/details/:name';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: homeNamed,
        path: homePath,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: detailsNamed,
        path: detailsPath,
        builder: (context, state) => DetailsPage(
          id: state.pathParameters['name']!,
        ),
      ),
    ],
  );
}
