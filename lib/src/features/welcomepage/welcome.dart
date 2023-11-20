import 'package:flutter/material.dart';
import '../login/login.dart';
import '../signup/signup.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  DateTime? _lastPressed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressed == null ||
            DateTime.now().difference(_lastPressed!) > Duration(seconds: 2)) {
          // Show the 'click again to exit' message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(elevation: 0.0,
              content: Center(child: Text('Press again to exit !',style: TextStyle(color: Theme.of(context).colorScheme.secondary),)),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.transparent
            ),
          );
          _lastPressed = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Stack(
          children: [
            Positioned(
              top: screenHeight / 4,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hostel Hub',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Bottom Container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Welcome",
                        style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    Text(
                      "Get started with your account",
                      style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 120),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 120),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const SignUp();
                        }));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
