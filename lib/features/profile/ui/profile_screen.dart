import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/app_data.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Text(
                    user?.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    user?.email ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.text80Color,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.appointments);
                            },
                            child: Text(
                              'My Appointments',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                          height: 30,
                          child: VerticalDivider(color: Colors.black),
                        ),
                        Expanded(
                          child: Text(
                            'Medical records',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 77,
                    child: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 70,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColors.text30Color,
                      child: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
