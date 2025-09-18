import 'package:flutter/material.dart';
import 'package:iti_doctor_app/features/home/ui/widgets/home_banner.dart';
import 'package:iti_doctor_app/features/home/ui/widgets/home_doctors.dart';
import 'package:iti_doctor_app/features/home/ui/widgets/home_header.dart';
import 'package:iti_doctor_app/features/home/ui/widgets/home_specializations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              HomeHeader(),
              SizedBox(height: 10),
              HomeBanner(),
              HomeSpecializations(),
              HomeDoctors(),
            ],
          ),
        ),
      ),
    );
  }
}
