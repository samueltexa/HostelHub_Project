import 'dart:math';
import 'package:flutter/material.dart';
import '../hostels/mixed_hostels.dart';
import '../hostels/single_hostels.dart';

class Booking extends StatefulWidget {
  Booking({Key? key});

  State<Booking> createState() => DashboardState();
}

class DashboardState extends State<Booking> {
  DateTime? currentBackPressTime;
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

  List<int> numberOfViews = []; // updated views list

  TextEditingController searchController = TextEditingController();

  List<String> filteredHostels = [];

  @override
  void initState() {
    super.initState();
    filteredHostels = hostels;
    numberOfViews =
        List.generate(hostels.length, (index) => generateRandomViews());
  }

  int generateRandomViews() {
    return Random().nextInt(221) + 30;
  }

  Color roomColor = Colors.blue;
  Color hostelColor = Colors.blue;
  int OptionPicked = -1;
  int appBarPresent = 100;

  AppBar AppBarPresent(isAppBarPresent) {
    if (isAppBarPresent == 1) {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              appBarPresent = 100;
              OptionPicked = -1;
            });
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text('SINGLE HOSTELS')),
      );
    }
    if (isAppBarPresent == 2) {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              appBarPresent = 100;
              OptionPicked = -1;
            });
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text('MIXED HOSTELS')),
      );
    } else {
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Column(
          children: [
            Center(child: Text('BOOKINGS')),
            SizedBox(height: 2),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 200,
              height: 25,
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    filteredHostels = hostels
                        .where((hostel) =>
                            hostel.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  fillColor: Colors.white,
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
                    vertical: 3,
                    horizontal: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 60,
      );
    }
  }

  Widget OptionRequired(int option, context) {
    if (option == 1) {
      return SingleHostels();
    }
    if (option == 2) {
      return MixedHostels();
    } else if (option == -1) {
      return Column(
        children: [
          SizedBox(height: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) {
              setState(() {
                roomColor = Colors.lightBlue;
              });
            },
            onExit: (_) {
              setState(() {
                roomColor = Colors.blue;
              });
            },
            child: InkWell(
              onTap: () {
                setState(() {
                  OptionPicked = 1;
                  appBarPresent = 1;
                });
              },
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.97,
                  child: Container(
                    decoration: BoxDecoration(
                      color: roomColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        'SINGLE HOSTELS',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) {
              setState(() {
                hostelColor = Colors.lightBlue;
              });
            },
            onExit: (_) {
              setState(() {
                hostelColor = Colors.blue;
              });
            },
            child: InkWell(
              onTap: () {
                setState(() {
                  OptionPicked = 2;
                  appBarPresent = 2;
                });
              },
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.97,
                  child: Container(
                    decoration: BoxDecoration(
                      color: hostelColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        'MIXED HOSTELS',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            "Recently Searched",
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 0.97,
              heightFactor: 1.07,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Theme.of(context).colorScheme.onSecondary,
                child: ListView.builder(
                  itemCount: filteredHostels.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text('${filteredHostels[index]}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Number of Students: ${numberOfStudents[index]}',
                                ),
                                Row(
                                  children: [
                                    Text('User Reviews: '),
                                    buildStarRating(userReviews[index]),
                                  ],
                                ),
                                Text('Cost per Room: shs. ${prices[index]}'),
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye),
                                    SizedBox(width: 1),
                                    Text('Views: ${numberOfViews[index]}'),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HostelDetails(
                                    hostelName: filteredHostels[index],
                                    price: prices[index],
                                  ),
                                ),
                              );
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
              ),
            ),
          ),
        ],
      );
    } else {
      return Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                Duration(seconds: 2)) {
          currentBackPressTime = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              content: Center(
                  child: Text(
                'Press again to exit !',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              )),
            ),
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBarPresent(appBarPresent),
        body: OptionRequired(OptionPicked, context),
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
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSecondary),
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
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00ADB5),
      ),
      child: Text(
        option,
        style: TextStyle(color: Color(0xFFFFFFFF)),
      ),
    );
  }
}
