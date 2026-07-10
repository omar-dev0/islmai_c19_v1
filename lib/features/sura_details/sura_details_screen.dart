import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_friday/core/app_colors.dart';
import 'package:islami_friday/features/home/tabs/quran/data/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String verses = "";

  @override
  Widget build(BuildContext context) {
    SuraModel suraMOdel =
        ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      readSuraFile(suraMOdel.number);
    }
    return Scaffold(
      backgroundColor: AppColors.secColor,
      appBar: AppBar(
        backgroundColor: AppColors.secColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          suraMOdel.english,
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/sura_details_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      suraMOdel.arabic,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        verses,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void readSuraFile(int index) async {
    String suraFile = await rootBundle.loadString("assets/files/$index.txt");
    List<String> versesList = suraFile.split("\n");

    for (int i = 0; i < versesList.length - 1; i++) {
      versesList[i] = "${versesList[i]} (${i + 1})";
    }
    setState(() {
      verses = versesList.join(" ");
    });
  }
}
