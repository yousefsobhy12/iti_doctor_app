import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Omar!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text100Color,
                ),
              ),
              Text(
                'How Are you Today?',
                style: TextStyle(fontSize: 12, color: AppColors.text80Color),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.profile);
          },
          child: CircleAvatar(
            backgroundColor: AppColors.text20Color,
            radius: 20,
            child: Icon(Icons.person, color: AppColors.text100Color),
          ),
        ),
      ],
    );
  }
}
