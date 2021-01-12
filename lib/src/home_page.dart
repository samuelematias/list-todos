import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Todo\'s')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text('itemt$index'),
        ),
      ),
    );
  }
}
