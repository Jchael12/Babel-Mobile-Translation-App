import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class NumbersPage extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'One': ['Korean - 하나 (hana)', 'Chinese - 一 (Yī)', 'Japanese - 1つ (1Tsu)'],
    'Two': ['Korean - 둘 (dul)', 'Chinese - 二 (Èr)', 'Japanese - 二 (Ni)'],
    'Three': ['Korean - 셋 (seht)', 'Chinese - 三 (Sān)', 'Japanese - 三つ (Mittsu)'],
    'Four': ['Korean - 넷 (neht)', 'Chinese - 四 (Sì)', 'Japanese - 四 (Shi)'],
    'Five': ['Korean - 다섯 (da-Sut)', 'Chinese - 五 (Wǔ)', 'Japanese - 五 (Go)'],
    'Six': ['Korean - 여섯 (yuh-Suht)', 'Chinese - 六 (Liù)', 'Japanese - 六 (Roku)'],
    'Seven': ['Korean - 일곱 (il-gohp)', 'Chinese - 七 (Qī)', 'Japanese - セブン (Sebun)'],
    'Eight': ['Korean - 여덟 (yuh-dul)', 'Chinese - 八 (Bā)', 'Japanese - 八 (Hachi)'],
    'Nine': ['Korean -  아홉 (ah-hope)', 'Chinese - 九 (Jiǔ)', 'Japanese - 九 (Kyū)'],
    'Ten': ['Korean - 열 (yul)', 'Chinese - 十 (Shí)', 'Japanese - 十 (Jū)'],
    // Add other phrases with their translations here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
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
