import 'package:flutter/material.dart';

class PhraseBook extends StatelessWidget {
  const PhraseBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PHRASEBOOK"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
