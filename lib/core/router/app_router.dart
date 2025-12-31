import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login_screen.dart';
import '../../features/home/dashboard_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/notification/notification_screen.dart';
import '../../features/announcement/announcement_list_screen.dart';
import '../../features/announcement/announcement_detail_screen.dart';
import 'scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> _shellNavigatorClassesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellClasses');
final GlobalKey<NavigatorState> _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorClassesKey,
          routes: [
            GoRoute(
              path: '/classes',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) => const NotificationScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/announcements',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AnnouncementListScreen(),
    ),
    GoRoute(
      path: '/announcements/detail',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AnnouncementDetailScreen(),
    ),
  ],
);
