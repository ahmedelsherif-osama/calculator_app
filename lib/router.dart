import 'package:calculator_app/home_page.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      builder: (context, state) => HomePage(),
      path: '/',
    )
  ],
);
