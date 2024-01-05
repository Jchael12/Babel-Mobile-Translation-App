import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class RestaurantAndShops extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'How much ?': ['Korean - 하나얼마나 많이 ? (eolmana manh-i ?)', 'Chinese - 多少 ？ (Duōshǎo?)', 'Japanese - いくら ？ (Ikura?)'],
    'Can I see the menu ?': ['Korean - 메뉴를 볼 수 있나요? (menyuleul bol su issnayo?)', 'Chinese - 我可以看一下菜单吗？ (Wǒ kěyǐ kàn yīxià càidān ma?)', 'Japanese - メニューを見てもいいですか？ (Menyū o mite mo īdesu ka?)'],
    'How many ?': ['Korean - 얼마나 많은가? (eolmana manh-eunga?)', 'Chinese - 多少 ？ (Duōshǎo?)', 'Japanese - 幾つか ？ (Ikutsu ka?)'],
    // Add other phrases with their translations here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resto and Shops Phrases'),
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
