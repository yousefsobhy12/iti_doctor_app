import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/core/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/svgs/app_logo.svg', height: 40),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        SvgPicture.asset('assets/svgs/splash_bg.svg'),
                        Container(
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withValues(alpha: 0.0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.14, 0.4],
                            ),
                          ),
                          child: Image.asset('assets/images/doctor.png'),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            spacing: 5,
                            children: [
                              Text(
                                'Best Doctor\nAppointment App',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                                style: TextStyle(
                                  color: AppColors.bodyColor,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  text: 'Get Started',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
