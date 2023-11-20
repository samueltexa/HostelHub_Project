import 'package:flutter/material.dart';
import 'package:hostelhub/src/features/settings/settings.dart';
import '../booking/bookings.dart';
import '../dashboard/dashboard.dart';

class ToNavigation extends StatefulWidget {
  const ToNavigation({super.key});

  @override
  State<ToNavigation> createState() => _ToNavigationState();
}

class _ToNavigationState extends State<ToNavigation> {
  int index = 0;
  final screens = [
    DashBoard(),
    Booking(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelTextStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 10))),
          child: NavigationBar(
            height: 60,
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "HOME"),
              NavigationDestination(icon: Icon(Icons.book), label: "BOOKING"),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: "SETTINGS")
            ],
          ),
        ));
  }
}
