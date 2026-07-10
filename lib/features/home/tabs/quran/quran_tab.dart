import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_friday/core/app_colors.dart';
import 'package:islami_friday/core/cache_helper.dart';
import 'package:islami_friday/core/data/sura_data.dart';
import 'package:islami_friday/features/home/tabs/quran/data/sura_model.dart';
import 'package:islami_friday/features/home/tabs/quran/widgets/most_recent_widget.dart';
import 'package:islami_friday/features/home/tabs/quran/widgets/sura_item.dart';
import 'package:islami_friday/features/sura_details/sura_details_screen.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filteredIndices = List.generate(englishSurah.length, (i) => i);

  void searchSura(String value) {
    if (value.isEmpty) {
      filteredIndices = List.generate(englishSurah.length, (i) => i);
    } else {
      final query = value.toLowerCase();
      filteredIndices = [];
      for (int i = 0; i < englishSurah.length; i++) {
        if (englishSurah[i].toLowerCase().contains(query) ||
            arabicSura[i].contains(value)) {
          filteredIndices.add(i);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_screen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/top_bar_logo.png',
              width: 100,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: TextField(
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                onChanged: (value) {
                  searchSura(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
                    fontWeight: FontWeight.w700,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      'assets/svg/quran.svg',
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (CacheHelper.getData(key: "last_sura") != null) ...[
              Text(
                'Most Recent',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => MostRecentWidget(
                    suraModel: SuraModel(
                      english:
                          englishSurah[int.parse(
                                CacheHelper.getData(key: "last_sura")[index],
                              ) -
                              1],
                      number: int.parse(
                        CacheHelper.getData(key: "last_sura")[index],
                      ),
                      verses:
                          ayaNumber[int.parse(
                                CacheHelper.getData(key: "last_sura")[index],
                              ) -
                              1],
                      arabic:
                          arabicSura[int.parse(
                                CacheHelper.getData(key: "last_sura")[index],
                              ) -
                              1],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: CacheHelper.getData(key: "last_sura") != null
                      ? CacheHelper.getData(key: "last_sura").length
                      : 0,
                ),
              ),
            ],

            SizedBox(height: 14),
            Text(
              'Sura List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: filteredIndices.isEmpty
                  ? Center(
                      child: Text(
                        'No Sura Found',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filteredIndices.length,
                      itemBuilder: (context, index) {
                        final suraIndex = filteredIndices[index];
                        final suraModel = SuraModel(
                          number: suraIndex + 1,
                          arabic: arabicSura[suraIndex],
                          english: englishSurah[suraIndex],
                          verses: ayaNumber[suraIndex],
                        );
                        return InkWell(
                          onTap: () async {
                            final current = CacheHelper.getData(
                              key: "last_sura",
                            );
                            final lastSuraList = current != null
                                ? List<String>.from(current)
                                : <String>[];

                            final suraNumber = suraModel.number.toString();

                            lastSuraList
                              ..remove(suraNumber)
                              ..insert(0, suraNumber);

                            await CacheHelper.setData(
                              key: "last_sura",
                              value:
                                  lastSuraList, // a List<String>, so setStringList works
                            );
                            setState(
                              () {},
                            ); // Refresh the UI to reflect the updated list
                            Navigator.pushNamed(
                              context,
                              SuraDetailsScreen.routeName,
                              arguments: suraModel,
                            );
                          },
                          child: SuraItem(suraModel: suraModel),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 30,
                        indent: 64,
                        endIndent: 64,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
