import 'package:go_router/go_router.dart';
import 'package:campus_lost_found/features/home/presentation/home_page.dart';
import 'package:campus_lost_found/features/found_items/presentation/found_item_details_page.dart';
import 'package:campus_lost_found/features/auth_demo/presentation/settings_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/item/:id',
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return FoundItemDetailsPage(itemId: itemId);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);

