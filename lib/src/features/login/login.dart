import 'package:flutter/material.dart';
import '../forgotpassword/forgotpassword.dart';
import '../navigationbar/navigationbar.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double appBarHeight = screenSize.height * 0.1;
    final double logoSize = screenSize.height * 0.2;
    final double formWidth = screenSize.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: screenSize.width * 0.08,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(
        children: [
          SizedBox(
            height: appBarHeight,
          ),
          Positioned(
            top: appBarHeight,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/icons/logo.png",
              height: logoSize,
              width: logoSize,
            ),
          ),
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
                  SizedBox(
                    height: screenSize.height * 0.08,
                    width: formWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        prefixIcon: Icon(Icons.person,
                            color: Theme.of(context).colorScheme.secondary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  SizedBox(
                    height: screenSize.height * 0.08,
                    width: formWidth,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        prefixIcon: Icon(Icons.lock,
                            color: Theme.of(context).colorScheme.secondary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.02,
                          horizontal: formWidth * 0.43,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const ToNavigation()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const ForgotPassword();
                        }),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3,
                        decorationColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
