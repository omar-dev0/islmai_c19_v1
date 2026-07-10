import 'package:flutter/material.dart';
import 'package:islami_friday/features/home/tabs/quran/data/sura_model.dart';
import 'package:islami_friday/features/sura_details/sura_details_screen.dart';

import '../../../../../core/app_colors.dart';

class MostRecentWidget extends StatelessWidget {
  SuraModel suraModel;
  MostRecentWidget({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: suraModel,
        );
      },
      child: Container(
        width: 320,
        padding: .only(left: 17, top: 12, bottom: 12),
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
                  suraModel.english,
                  style: TextStyle(
                    color: AppColors.secColor,
                    fontSize: 24,
                    fontWeight: .bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  suraModel.arabic,
                  style: TextStyle(
                    color: AppColors.secColor,
                    fontSize: 24,
                    fontWeight: .bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${suraModel.verses} Verses  ",
                  style: TextStyle(
                    color: AppColors.secColor,
                    fontSize: 14,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/quran.png', width: 153),
          ],
        ),
      ),
    );
  }
}
