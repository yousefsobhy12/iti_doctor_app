import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/features/home/logic/home_provider.dart';
import 'package:provider/provider.dart';

class HomeDoctors extends StatelessWidget {
  const HomeDoctors({super.key});

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
                    'Recommendation Doctors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text100Color,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.doctors,
                      arguments: value.doctors,
                    );
                  },
                  child: Text('See All'),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.doctorDetails,
                  arguments: value.doctors[index],
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.text50Color,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP9VcMn-KypOVElikk37BvVvHZHMnoOO44Lg&s',
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Icon(Icons.error, color: Colors.black);
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(
                            value.doctors[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.text100Color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${value.doctors[index].specialization.name} | ${value.doctors[index].degree}',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.bodyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 14),
              itemCount: value.doctors.length > 6 ? 6 : 0,
            ),
          ],
        );
      },
    );
  }
}
