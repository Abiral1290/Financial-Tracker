import 'package:fintechhackathonproject/src/components/chatbot/ui/chatbot.dart';
import 'package:fintechhackathonproject/src/components/loginIn/provider/AuthenticationProvider.dart';
import 'package:fintechhackathonproject/src/components/loginIn/ui/logIn.dart';
import 'package:fintechhackathonproject/src/components/signup/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../components/dataSecurity/ui/datSecurityPage.dart';


class AppRouter {
  static GoRouter createRouter(AuthenticationProvider authProvider) {
    return GoRouter(
      initialLocation: authProvider.user != null ? '/home' : '/',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomeScreen(),
        ),

        GoRoute(
          path: '/datasecurity',
          builder: (context, state) => DataSecurityPage(),
        ),
      ],
        redirect: (context, state) {
          final user = authProvider.user;
          final loggingIn = state.uri.toString() == '/home' || state.uri.toString() == '/home';
          if (user == null && !loggingIn) {
            return '/home';
          }
          if (user != null && loggingIn) {
            return '/home';
          }
          return null;
        }
    );
  }
}
