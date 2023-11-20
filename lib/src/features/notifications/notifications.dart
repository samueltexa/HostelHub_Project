import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('${index + 1} Notifications'),
                subtitle: Text('Check Out Reminder ${index + 1}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Notification Details'),
                      content: Text('Your changes to the hostel booking have been updated successfully'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
            ],
          );
        },
      ),
    );
  }
}
