import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hostelhub/src/features/history/booking_history/payment_history.dart';
import 'package:hostelhub/src/features/updates/updates.dart';
import 'package:hostelhub/src/features/user/user.dart';
import '../contact/contact.dart';
import '../history/booking_history/booking_history.dart';
import '../notifications/notifications.dart';
import '../reviews/reviews.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key});

  State<DashBoard> createState() => DashboardState();
}

class DashboardState extends State<DashBoard> {
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
    return Random().nextInt(221) + 30; // Random number between 30 and 250
  }

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
        title: Center(child: Text('My Account')),
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
        title: Center(child: Text('Booking History')),
      );
    }
    if (isAppBarPresent == 3) {
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
        title: Center(child: Text('Payment History')),
      );
    }
    if (isAppBarPresent == 4) {
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
        title: Center(child: Text('User Reviews')),
      );
    }
    if (isAppBarPresent == 5) {
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
        title: Center(child: Text('Notifications')),
      );
    }
    if (isAppBarPresent == 6) {
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
        title: Center(child: Text('Updates')),
      );
    }
    if (isAppBarPresent == 7) {
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
        title: Center(child: Text('Contact And Support')),
      );
    } else {
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Column(
          children: [
            Center(child: Text('DASHBOARD')),
            SizedBox(height: 2),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 200,
              height: 25,
              child: TextField(
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
        toolbarHeight: 65,
      );
    }
  }

  Widget OptionRequired(int option, context) {
    if (option == 1) {
      return User();
    }
    if (option == 2) {
      return Booking_History();
    }
    if (option == 3) {
      return Payment_History();
    }
    if (option == 4) {
      return Reviews();
    }
    if (option == 5) {
      return Notifications();
    }
    if (option == 6) {
      return Updates();
    }
    if (option == 7) {
      return Contact();
    } else if (option == -1) {
      return ListView(
        children: [
          Text("Featured Hostels",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSecondary)),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.97,
              child: Container(
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
                height: 277,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          Text("Recently Searched",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSecondary)),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.97,
              child: Container(
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
                color: Theme.of(context).colorScheme.onSecondary,
                height: 277,
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
                style:
                    TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
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
        drawer: Container(
          width: 250,
          child: Drawer(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'MORE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('MY ACCOUNT'),
                  onTap: () {
                    setState(() {
                      OptionPicked = 1;
                      appBarPresent = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('BOOKING HISTORY'),
                  onTap: () {
                    setState(() {
                      OptionPicked = 2;
                      appBarPresent = 2;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text('PAYMENTS HISTORY'),
                  onTap: () {
                    setState(() {
                      OptionPicked = 3;
                      appBarPresent = 3;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('USER REVIEWS'),
                  onTap: () {
                    setState(() {
                      OptionPicked = 4;
                      appBarPresent = 4;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('NOTIFICATIONS'),
                  onTap: () {
                    setState(() {
                      OptionPicked = 5;
                      appBarPresent = 5;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: Icon(Icons.update),
                  title: Text('UPDATES'),
                  onTap: () {
                    // Handle updates tap
                    setState(() {
                      OptionPicked = 6;
                      appBarPresent = 6;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('CONTACT'),
                  onTap: () {
                    // Handle settings tap
                    setState(() {
                      OptionPicked = 7;
                      appBarPresent = 7;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text("Version 2.2.1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: Text("@Copyright Group Five",
                        style: TextStyle(fontSize: 15))),
              ],
            ),
          ),
        ),
        body: OptionRequired(OptionPicked, context),
      ),
    );
  }
}

Widget buildStarRating(double rating) {
  int numStars = rating.round();
  List<Widget> stars = List.generate(
    5,
    (index) => Icon(index < numStars ? Icons.star : Icons.star_border,
        color: Colors.cyan),
  );
  return Row(children: stars);
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
