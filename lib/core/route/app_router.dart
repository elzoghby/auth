import 'package:auth/core/route/transitions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'app_paths.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: splashScreenRoute,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final userId = state.uri.queryParameters['userId'];
        if (userId != null) {
          return buildPageWithPushStyle(
              key: state.pageKey, child: SignUpScreen(invitedId: userId));
        }
        return buildPageWithPushStyle(
            key: state.pageKey, child: SplashScreen());
      },
    ),
    GoRoute(
        path: mainScreenRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithPushStyle(
            key: state.pageKey,
            child: const HomeScreen(),
          );
        }),
    GoRoute(
      path: loginScreenRoute,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithPushStyle(key: state.pageKey, child: LoginScreen()),
    ),
    GoRoute(
      path: signUpScreenRoute,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithPushStyle(
              key: state.pageKey, child: const SignUpScreen()),
    ),
  ],
);
