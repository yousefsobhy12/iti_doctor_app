import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_doctor_app/core/router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/svgs/splash_bg.svg'),
            SvgPicture.asset('assets/svgs/app_logo.svg'),
          ],
        ),
      ),
    );
  }
}
