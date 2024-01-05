import 'package:flutter/material.dart';

class GreetingsAndResponse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GreetingsAndResponse'),
      ),
      body: Center(
        child: Text(
          'Content for GreetingsAndResponse box goes here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
