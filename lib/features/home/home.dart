import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_friday/core/app_colors.dart';
import 'package:islami_friday/features/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_friday/features/home/tabs/quran/quran_tab.dart';
import 'package:islami_friday/features/home/tabs/radio/radio_tab.dart';
import 'package:islami_friday/features/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_friday/features/home/tabs/time/time_tab.dart';

class Home extends StatefulWidget {
  static const String homeRoute = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.secColor,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: "Quran",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secColor.withValues(alpha: .6),
              ),
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                "assets/svg/quran.svg",
              ),
            ),
            icon: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                AppColors.secColor,
                BlendMode.srcIn,
              ),
              "assets/svg/quran.svg",
            ),
          ),
          BottomNavigationBarItem(
            label: "Hadith",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secColor.withValues(alpha: .6),
              ),
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                "assets/svg/book.svg",
              ),
            ),
            icon: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                AppColors.secColor,
                BlendMode.srcIn,
              ),
              "assets/svg/book.svg",
            ),
          ),
          BottomNavigationBarItem(
            label: "Sebha",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secColor.withValues(alpha: .6),
              ),
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                "assets/svg/sebha.svg",
              ),
            ),

            icon: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                AppColors.secColor,
                BlendMode.srcIn,
              ),
              "assets/svg/sebha.svg",
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secColor.withValues(alpha: .6),
              ),
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                "assets/svg/radio.svg",
              ),
            ),

            label: "radio",
            icon: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                AppColors.secColor,
                BlendMode.srcIn,
              ),
              "assets/svg/radio.svg",
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secColor.withValues(alpha: .6),
              ),
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                "assets/svg/time.svg",
              ),
            ),

            label: "Time",
            icon: SvgPicture.asset(
              "assets/svg/time.svg",
              colorFilter: ColorFilter.mode(
                AppColors.secColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
