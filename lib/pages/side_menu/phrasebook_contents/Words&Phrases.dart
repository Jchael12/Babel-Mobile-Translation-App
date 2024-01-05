import 'package:flutter/material.dart';

class WordsPhrases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordsPhrases'),
      ),
      body: Center(
        child: Text(
          'Content for WordsPhrases box goes here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
