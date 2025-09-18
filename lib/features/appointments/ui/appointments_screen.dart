import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/features/appointments/logic/appointments_provider.dart';
import 'package:provider/provider.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Consumer<AppointmentsProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            itemBuilder: (context, index) => Column(
              spacing: 5,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.appointments[index].status,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            value.appointments[index].appointmentTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.text80Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  ],
                ),
                Divider(color: AppColors.text50Color),
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
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
                            value.appointments[index].doctor.name,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.text100Color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${value.appointments[index].doctor.specialization.name} | ${value.appointments[index].doctor.degree}',
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
              ],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: value.appointments.length,
          );
        },
      ),
    );
  }
}
