import 'package:flutter/material.dart';

class Updates extends StatelessWidget {
  const Updates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
        children: <Widget>[
          Text("You will be notified for new updates",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 16), // Add some spacing between the text and the button
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Refresh',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
