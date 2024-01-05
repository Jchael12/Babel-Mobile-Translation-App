// NumbersPage.dart
import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: Center(
        child: Text(
          'Content for Numbers box goes here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
