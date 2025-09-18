import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/features/home/logic/home_provider.dart';
import 'package:provider/provider.dart';

class HomeSpecializations extends StatelessWidget {
  const HomeSpecializations({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Doctor Speciality',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text100Color,
                    ),
                  ),
                ),
                TextButton(onPressed: () {}, child: Text('See All')),
              ],
            ),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffF4F8FF),
                      child: Icon(
                        Icons.category,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text(value.specializations[index].name),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemCount: value.specializations.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
