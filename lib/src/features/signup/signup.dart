import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
            "Sign Up",
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
                children: [
                  const SizedBox(height: 45),
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
                  SizedBox(height: screenSize.height * 0.02),
                  SizedBox(
                    height: screenSize.height * 0.08,
                    width: formWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        prefixIcon: Icon(Icons.email,
                            color: Theme.of(context).colorScheme.secondary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
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
                  SizedBox(height: screenSize.height * 0.02),
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
                      // functionality
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
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
