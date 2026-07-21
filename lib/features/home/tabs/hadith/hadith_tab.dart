import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_friday/features/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_friday/features/home/tabs/hadith/models/hadeth_model.dart';

class HadithTab extends StatelessWidget {
  List<HadethModel> allAhadeth = [];
  HadithTab({super.key}) {
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_tab_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Container(
            width: 289,
            alignment: Alignment.center,
            child: Image.asset("assets/images/top_bar_logo.png"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 0.72,
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: allAhadeth.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          HadethDetailsScreen.routeName,
                          arguments: i,
                        );
                      },
                      child: Stack(
                        alignment: AlignmentGeometry.topCenter,
                        children: [
                          Image.asset("assets/images/hadeth_bg.png"),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 24),
                                Text(
                                  i.title.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Text(
                                            i.content.join("\n").toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  loadHadethFile() async {
    String hadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadeth.split("#");
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;

      print(title);
      HadethModel hadethModel = HadethModel(title, content);
      allAhadeth.add(hadethModel);
    }
  }
}
