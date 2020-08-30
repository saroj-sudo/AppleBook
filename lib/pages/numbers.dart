import 'package:flutter/material.dart';

class Numbers extends StatefulWidget {
  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers"),
        centerTitle: true,
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(20, (index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "${index +1}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          })),
    );
  }
}
