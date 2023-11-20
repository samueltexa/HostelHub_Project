import 'package:flutter/material.dart';

class Payment_History extends StatelessWidget {
  Payment_History({Key? key});

  final List<String> hostelNames = [
    'ENGINEERS HOSTEL',
    'TANK HILL',
    'TRIPLE B',
    'TASO HOSTEL',
    'MUST HALLS',
    'KASH HOSTEL',
    'BOOMA HOSTEL',
    'CORPUS CHRIST'
  ];

  final List<double> prices = [
    600000.00,
    1500000.00,
    500000.00,
    650000.00,
    450000.00,
    480000.0,
    700000.00,
    900000.00
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: ListView.builder(
        itemCount: hostelNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                title: Text(hostelNames[index]),
                subtitle: Text('Payment: Shs. ${prices[index]}'),
              ),
              Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add any action when the refresh button is pressed
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
