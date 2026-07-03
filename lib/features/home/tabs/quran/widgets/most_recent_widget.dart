import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 300,
      padding: .only(left: 17, top: 12 , bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: .circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Al-Anbiya",
                style: TextStyle(
                  color: AppColors.secColor,
                  fontSize: 24,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "الأنبياء",
                style: TextStyle(
                  color: AppColors.secColor,
                  fontSize: 24,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "112 Verses  ",
                style: TextStyle(
                  color: AppColors.secColor,
                  fontSize: 14,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
          Image.asset('assets/images/quran.png' , width: 153,)
        ],
      ),
    );
  }
}
