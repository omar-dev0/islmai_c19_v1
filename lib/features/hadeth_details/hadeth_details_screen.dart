import 'package:flutter/material.dart';
import 'package:islami_friday/core/app_colors.dart';
import 'package:islami_friday/features/home/tabs/hadith/models/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethScreen";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
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
          model.title,
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
            padding: const EdgeInsets.all(34.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      model.content.join("\n"),
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
        ],
      ),
    );
  }
}
