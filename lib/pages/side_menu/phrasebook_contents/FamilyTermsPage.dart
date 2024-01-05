import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class FamilyTermsPage extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'Family': ['Korean - 가족 (gajog)', 'Chinese - 家庭 (Jiātíng)', 'Japanese - 家族 (Kazoku)'],
    'Parents': ['Korean - 부모님 (bumonim)', 'Chinese - 父母 (Fùmǔ)', 'Japanese - 両親 (Ryōshin)'],
    'Father': ['Korean - 아버지 (abeoji)', 'Chinese - 父亲 (Fùmǔ)', 'Japanese - 父親 (Chichioya)'],
    'Dad': ['Korean - 아빠 (appa)', 'Chinese - 爸爸 (Bàba)', 'Japanese - お父さん (Otōsan)'],
    'Mother': ['Korean - 아빠어머니 (eomeoni)', 'Chinese - 母亲 (Mǔqīn)', 'Japanese - 母親 (Hahaoya)'],
    'Mom': ['Korean - 엄마 (eomma)', 'Chinese - 妈妈 (Māmā)', 'Japanese - お母さん (Okāsan)'],
    'Big Brother': ['Korean - 형 (hyeong), 오빠 (oppa)', 'Chinese - 老大哥 (Lǎo dàgē)', 'Japanese - 兄 (Ani)'],
    'Big Sister': ['Korean - 누나 (nuna), 언니 (eonni)', 'Chinese - 姐姐 (Jiějiě)', 'Japanese - お姉さん (Onēsan)'],
    'Younger Brother': ['Korean - 남동생 (namdongsaeng)', 'Chinese - 弟弟 (Dìdì)', 'Japanese - 弟 (Otōto)'],
    'Grand Father': ['Korean - 할아버지 (harabeoji)', 'Chinese - 祖父 (Zǔfù)', 'Japanese - 祖父 (Sofu)'],
    'Grand Mother': ['Korean - 할머니 (halmeoni)', 'Chinese - 祖母 (Zǔmǔ)', 'Japanese - 祖母 (Sobo)'],
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
