import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(child: Text("SA")),
            SizedBox(height: 10),
            Text("Group Five"),
            TextField(
              decoration: InputDecoration(labelText: 'Fist name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Current address'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Faculty'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Course'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {},
              child: Text('Update',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
            ),
          ],
        ),
      )
    );
  }
}
