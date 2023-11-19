import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Contact us",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+256 7711 72559'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('groupfive@support.us'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/whatsapp.jpeg',
                width: 50,
                height: 50,
              ),
              title: Text('Whatsapp'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/Facebook.jpeg',
                width: 50,
                height: 50,
              ),
              title: Text('Facebook'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
