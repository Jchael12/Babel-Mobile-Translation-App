import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class FamilyTermsPage extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'Family': ['Korean - 가족 (gajog)', 'Chinese - 家庭 (Jiātíng)', 'Japanese - 家族 (Kazoku)'],
    'Parents': ['Korean - 부모님 (bumonim)', 'Chinese - 父母 (Fùmǔ)', 'Japanese - 両親 (Ryōshin)'],
    // Add other phrases with their translations here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Terms'),
        backgroundColor: darkColor,
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (BuildContext context, int index) {
          String phrase = phrases.keys.elementAt(index);
          List<String> translations = phrases.values.elementAt(index);

          return ExpansionTile(
            title: Text(
              phrase,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: translations.map((translation) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  translation,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
