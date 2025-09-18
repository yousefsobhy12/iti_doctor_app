import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: AssetImage('assets/images/home_banner_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 14,
          child: Image.asset('assets/images/doctor_female.png'),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book and\nschedule with\nnearest doctor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Text(
                  'Find Nearby',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
