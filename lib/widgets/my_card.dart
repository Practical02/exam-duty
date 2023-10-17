import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String dutyDate; // Add a parameter to hold the duty date

  const MyCard({Key? key, required this.dutyDate})
      : super(key: key); // Constructor with dutyDate parameter

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: 150,
        child: Card(
          elevation: 4,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Main duty on',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    dutyDate, // Use the dutyDate parameter here
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
