import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_friday/core/app_colors.dart';
import 'package:islami_friday/core/data/sura_data.dart';
import 'package:islami_friday/features/home/tabs/quran/data/sura_model.dart';
import 'package:islami_friday/features/home/tabs/quran/widgets/most_recent_widget.dart';
import 'package:islami_friday/features/home/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_screen.png'),
          fit: .cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Image.asset(
              'assets/images/top_bar_logo.png',
              width: 100,
              height: 200,
            ),
            Padding(
              padding: .only(right: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: .circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: .circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  fillColor: AppColors.secColor.withValues(alpha: .7),
                  filled: true,
                  hintText: 'Sura Name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: .w700,
                  ),
                  prefixIcon: Padding(
                    padding: .all(15),
                    child: SvgPicture.asset(
                      'assets/svg/quran.svg',
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        .srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Most Recent',
              style: TextStyle(
                color: Colors.white,
                fontWeight: .w700,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index) => MostRecentWidget(),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Sura List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: .w700,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => SuraItem(
                  suraModel: SuraModel(
                    number: index + 1,
                    arabic: arabicSura[index],
                    english: englishSurah[index],
                    verteces: ayaNumber[index],
                  ),
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 30,
                  indent: 64,
                  endIndent: 64,
                  color: Colors.white,
                ),
                itemCount: 144,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
