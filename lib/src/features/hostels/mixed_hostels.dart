import 'package:flutter/material.dart';
import 'dart:math';

class MixedHostels extends StatefulWidget {
  const MixedHostels({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<MixedHostels> {
  List<String> hostels = [
    'WILSA HOSTEL',
    'SWAGG HILL',
    'BECKO HOSTEL',
    'TASO HOSTEL',
    'MARK HOSTEL',
    'HASTEN HOSTEL',
    'DESIRE HOSTEL',
    'BIG BROTHER CHRIST'
  ];
  List<int> numberOfStudents = [157, 90, 73, 60, 100, 70, 115, 80];
  List<double> userReviews = [4.5, 3.8, 4.2, 4.0, 4.7, 4.1, 4.3, 4.6];
  List<double> prices = [
    600000.00,
    1500000.00,
    500000.00,
    650000.00,
    450000.00,
    480000.0,
    700000.00,
    900000.00
  ];
  List<int> numberOfViews = [0, 0, 0, 0, 0, 0, 0, 0]; // initial views

  TextEditingController searchController = TextEditingController();

  List<String> filteredHostels = [];

  @override
  void initState() {
    super.initState();
    filteredHostels = hostels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Column(
          children: [
            Center(
              child: Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: 200,
                height: 25,
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    filterHostels(value);
                  },
                  cursorColor: Theme.of(context).colorScheme.primary,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onSecondary,
                    filled: true,
                    hintText: 'Search here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 3, // vertical padding
                      horizontal: 50, // horizontal padding
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 40,
      ),
      body: filteredHostels.isEmpty
          ? Center(
        child: Text(
          'Your search is not available.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: filteredHostels.length,
        itemBuilder: (context, index) {
          // Generating random number of views between 5 and 10
          numberOfViews[index] = Random().nextInt(100) + 10;
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ListTile(
                  title: Text('${filteredHostels[index]}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Number of Students: ${numberOfStudents[index]}'),
                      Row(
                        children: [
                          Text('User Reviews: '),
                          buildStarRating(userReviews[index]),
                        ],
                      ),
                      Text('Cost per Room: ${prices[index]} shs'),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 5),
                          Text('Views: ${numberOfViews[index]}'),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    navigateToHostelDetails(
                        context, filteredHostels[index], prices[index]);
                  },
                  leading: Image.asset(
                    'assets/images/hostel/${filteredHostels[index].toLowerCase()}.jpeg',
                    width: 50,
                    height: 60,
                  ),
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

  Widget buildStarRating(double rating) {
    int numStars = rating.round();
    List<Widget> stars = List.generate(
      5,
          (index) => Icon(
        index < numStars ? Icons.star : Icons.star_border,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
    return Row(children: stars);
  }

  void navigateToHostelDetails(
      BuildContext context, String hostelName, double price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HostelDetails(hostelName: hostelName, price: price),
      ),
    );
  }

  void filterHostels(String query) {
    setState(() {
      filteredHostels = hostels
          .where((hostel) => hostel.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}

class HostelDetails extends StatelessWidget {
  final String hostelName;
  final double price;

  const HostelDetails({Key? key, required this.hostelName, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('$hostelName')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/hostel/${hostelName.toLowerCase()}.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hostel: $hostelName',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Payment Options:',
                    style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildPaymentOptionButton('VISA'),
                      buildPaymentOptionButton('AIRTEL'),
                      buildPaymentOptionButton('MTN'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount to Pay:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'shs.${price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOptionButton(String option) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00ADB5),
      ),
      child: Text(option,style: TextStyle(
          color: Color(0xFFFFFFFF)
      ),),
    );
  }
}
