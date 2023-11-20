import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../welcomepage/welcome.dart';

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      title: const Text("Terms and Use"),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "1. Acceptance of Terms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
                "By accessing or using the HostelHub mobile application (\"App\") developed by \"Group Five\", you agree to comply with and be bound by these Terms of Use. If you do not agree to these terms, please do not use the App.",
                style: TextStyle(fontSize: 17)),
            SizedBox(height: 16),
            Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              "1. Information We Collect",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
                "We may collect personal information such as your name, contact information, and payment details when you use the App. We also collect non-personal information such as device information and usage data.",
                style: TextStyle(fontSize: 17)),
            Text(
              "2. How We Use Your Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
                "We use your information to process orders, improve the App, and communicate with you. We do not sell or rent your personal information to third parties.",
                style: TextStyle(fontSize: 17)),
            Text(
              "3. Security",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
                "We implement security measures to protect your information. However, no method of transmission over the Internet is completely secure, and we cannot guarantee the security of your data.",
                style: TextStyle(fontSize: 17)),
            Text(
              "4. Cookies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
                "We may use cookies and similar technologies to enhance your experience on the App.",
                style: TextStyle(fontSize: 17)),
            Text(
              "5. Third-Party Links",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
                "The App may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these third parties.",
                style: TextStyle(fontSize: 17)),
            Text(
              "6. Changes to Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
                "We may update our Privacy Policy from time to time. You will be notified of any changes.",
                style: TextStyle(fontSize: 17)),
            SizedBox(
              height: 10,
            ),
            Text(
                "By using the App, you acknowledge that you have read and agree to both the Terms of Use and the Privacy Policy. If you do not agree with these terms, please do not use the App.",
                style: TextStyle(fontSize: 17))
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              ),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFFFFFFF))),
          onPressed: () {
            Navigator.of(context).pop();
            SystemNavigator.pop();
          },
          child: const Text("Cancel", style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Welcome()),
              (route) => false,
            );
          },
          child: const Text(
            "Agree",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
