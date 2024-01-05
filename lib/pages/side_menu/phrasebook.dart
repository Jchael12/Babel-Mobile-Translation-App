import 'package:flutter/material.dart';
import 'package:translate/pages/side_menu/phrasebook_contents/Direction&SurvivalPage.dart';
import 'package:translate/pages/side_menu/phrasebook_contents/FamilyTermsPage.dart';
import 'package:translate/pages/side_menu/phrasebook_contents/Greetings&ResponsePage.dart';
import 'package:translate/pages/side_menu/phrasebook_contents/NumbersPage.dart';
import 'package:translate/pages/side_menu/phrasebook_contents/Restaurant&CafePhrase.dart';
import 'package:translate/pages/side_menu/phrasebook_contents/Words&Phrases.dart';
import "package:translate/utils/colors.dart";

class PhraseBook extends StatelessWidget {
  const PhraseBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PHRASEBOOK"),
        centerTitle: true,
        backgroundColor: darkColor,
      ),
      body: Container(
        color: darkColor,
        child: Center(
          child: ClickableContainerList(),
        ),
      ),
    );
  }
}

class ClickableContainerList extends StatelessWidget {
  final List<String> containerLabels = [
    'Numbers',
    'Family Terms',
    'Greetings and Response',
    'Direction and Survival Phrases',
    'Words and Phrases used in Classroom',
    'Restaurants, Cafe, Shops',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: containerLabels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Perform an action when the container is clicked
            switch (index) {
              case 0:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NumbersPage())
              );
                break;
              case 1:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FamilyTermsPage())
              );
                break;
              case 2:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GreetingsAndResponse())
              );
                break;
              case 3:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DirectionAndSurvival())
              );
                break;
              case 4:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WordsPhrases())
              );
                break;
              case 5:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RestaurantAndShops())
              );
                break;
              default:
            }
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration( 
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text(
                '${containerLabels[index]}',
                style: TextStyle(color: Colors.white, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
