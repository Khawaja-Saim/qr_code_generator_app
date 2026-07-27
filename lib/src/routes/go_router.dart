import 'package:qr_code_generator_app/main.dart';
import 'package:qr_code_generator_app/src/routes/route_transition.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_generator_app/src/screen/qr_generator_screen.dart';
import 'error_route.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.myHomePage}',
    routes: [
      GoRoute(
        name: AppRoute.myHomePage,
        path: '/${AppRoute.myHomePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: QRGeneratorScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String myHomePage = 'My-Home-Page';
}
