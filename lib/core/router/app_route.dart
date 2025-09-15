import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/features/login/logic/login_provider.dart';
import 'package:iti_doctor_app/features/login/ui/login_screen.dart';
import 'package:iti_doctor_app/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:iti_doctor_app/features/splash/ui/splash_screen.dart';
import 'package:provider/provider.dart';

class AppRoute {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
