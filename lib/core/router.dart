import 'package:enkolayyemek/app_navigate.dart';
import 'package:enkolayyemek/views/favorites_page.dart';
import 'package:enkolayyemek/views/home_page.dart';
import 'package:enkolayyemek/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _routerKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _routerKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppNavigate(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
