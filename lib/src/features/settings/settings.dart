import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  DateTime? currentBackPressTime;
  Settings({Key? key}) : super(key: key);

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
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(child: Text('Account Settings')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(child: Text("SA")),
              SizedBox(height: 10),
              Text("Group Five"),
              TextField(
                decoration: InputDecoration(labelText: 'Change Username'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Change Email'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Current Password'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'New Password'),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {},
                child: Text('Save Changes',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
