import 'package:flutter/material.dart';
import 'package:islami_friday/features/home/tabs/quran/data/sura_model.dart';

class SuraItem extends StatelessWidget {
  final SuraModel suraModel;
  const SuraItem({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 23),
      child: Row(
        children: [
          Container(
            padding: .symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ring.png'),
              ),
            ),
            child: Text(
              suraModel.number.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: .w700,
              ),
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  suraModel.english,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: .w700,
                  ),
                ),
                Text(
                  '${suraModel.verses} Verses  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: .w700,
                  ),
                ),
              ],
            ),
          ),
          Text(
            suraModel.arabic,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: .w700,
            ),
          ),
        ],
      ),
    );
  }
}
