import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/networking/dio_factory.dart';
import 'package:iti_doctor_app/core/router/app_route.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_themes.dart';

void main() {
  DioFactory.init();
  runApp(const DocDoc());
}

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute().onGenerateRoute,
      initialRoute: Routes.splash,
    );
  }
}
