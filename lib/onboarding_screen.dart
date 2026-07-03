import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'features/home/home.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String route = "onboarding";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/top_bar_logo.png", width: 270),
            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: Color(0xFF202020),
                pages: [
                  PageViewModel(
                    titleWidget: Text(
                      "",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    bodyWidget: Text(
                      "Welcome To Islmi App",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    image: Image.asset("assets/images/intro1.png"),
                    decoration: PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Welcome To Islami",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyWidget: Text(
                      "We Are Very Excited To Have You In Our Community",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    image: Image.asset("assets/images/intro2.png"),
                    decoration: PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Reading the Quran",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyWidget: Text(
                      "Read, and your Lord is the Most Generous",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    image: Image.asset("assets/images/intro3.png"),
                    decoration: PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Bearish",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyWidget: Text(
                      "Praise the name of your Lord, the Most High",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    image: Image.asset("assets/images/intro4.png"),
                    decoration: PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Holy Quran Radio",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFE2BE7F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyWidget: Text(
                      "You can listen to the Holy Quran Radio through the application for free and easily",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Color(0xFFE2BE7F)),
                    ),

                    image: Image.asset("assets/images/intro5.png"),
                    decoration: PageDecoration(imageFlex: 2),
                  ),
                ],
                showBackButton: true,
                showNextButton: true,
                dotsFlex: 2,
                dotsDecorator: DotsDecorator(
                  activeColor: Color(0xFFE2BE7F),
                  activeSize: const Size(20.0, 10.0),
                  spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFF707070),
                ),
                back: Text(
                  "back",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFE2BE7F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                next: Text(
                  "next",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFE2BE7F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                done: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFE2BE7F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onDone: () {
                  Navigator.pushNamedAndRemoveUntil(context, Home.homeRoute, (_)=>false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
