import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class GreetingsAndResponse extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'Hello': ['Korean - 안녕하세요 (annyeonghaseyo)', 'Chinese - 你好 (Nǐ hǎo)', "Japanese - こんにちは (Kon'nichiwa)"],
    'Good Morning': ['Korean - 좋은 아침이에요 (joh-eun achim-ieyo)', 'Chinese - 早上好 (Zǎoshang hǎo)', "Japanese - おはよう (Ohayō)"],
    'Good Afternoon': ['Korean - 좋은 오후에요 (joh-eun ohueyo)', 'Chinese - 下午好 (Xiàwǔ hǎo)', "Japanese - こんにちは (Kon'nichiwa)"],
    'Good Evening': ['Korean - 좋은 저녁이에요 (joh-eun jeonyeog-ieyo)', 'Chinese - 晚上好 (Wǎnshàng hǎo)', "Japanese - こんばんは (Konbanwa)"],
    'Thank You': ['Korean - 감사합니다 (gamsahabnida)', 'Chinese - 谢谢 (Xièxiè)', "Japanese - ありがとう (Arigatō)"],
    'Yes': ['Korean - 예 (ye)', 'Chinese - 是的 (Shì de)', "Japanese - はい (hai)"],
    'No': ['Korean - 아니요 (aniyo)', 'Chinese - 不 (Bù)', "Japanese - いいえ (Īe)"],
    'Excuse Me': ['Korean - 실례합니다 (sillyehabnida)', 'Chinese - 打扰一下 (Dǎrǎo yīxià)', "Japanese - すみません (Sumimasen)"],
    "You're Welcome": ['Korean - 천만에요 (cheonman-eyo)', 'Chinese - 不客气 (Bù kèqì)', "Japanese - どういたしまして (Dōitashimashite)"],
    // Add other phrases with their translations here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greetings And Response'),
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
