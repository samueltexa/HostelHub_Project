import 'package:flutter/material.dart';

class Booking_History extends StatelessWidget {
  Booking_History({super.key});

  final List<String> hostelNames = [
    'ENGINEERS HOSTEL',
    'TANK HILL',
    'TRIPLE B',
    'TASO HOSTEL',
    'MUST HALLS',
    'KASH HOSTEL',
    'BOOMA HOSTEL',
    'CORPUS CHRIST',
  ];

  final List<double> hostelPrices = [
    600000.00,
    1500000.00,
    500000.00,
    650000.00,
    450000.00,
    480000.0,
    700000.00,
    900000.00,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: ListView.builder(
        itemCount: hostelNames.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ListTile(
                  title: Text(hostelNames[index]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in Date: 2023-01-01'),
                      Text('Check-out Date: 2023-01-10'),
                      Row(
                        children: [
                          Text('Total Cost: '),
                          Text(
                            'shs. ${hostelPrices[index].toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: Icon(Icons.hotel, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
