import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostelhub/src/features/introduction/terms_of_use.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int currentPage = 0;
  List<IntroductionContent> contents = [
    IntroductionContent(
      'CONSIDERATE SERVICE',
      '24 hours at your service',
      'assets/images/intro1.jpg',
    ),
    IntroductionContent(
      'MAKE BOOKINGS',
      '',
      'assets/images/intro2.jpg',
    ),
    IntroductionContent(
      'SECURE PAYMENTS',
      '',
      'assets/images/intro3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 20,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: contents.length,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (_, i) {
              return _buildPage(contents[i]);
            },
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicators(),
                const SizedBox(
                  height: 100,
                ),
                _buildGetStartedButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(IntroductionContent content) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            content.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF00ADB5),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            content.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(content.image),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < contents.length; i++)
          _buildCircle(isFilled: i == currentPage),
      ],
    );
  }

  Widget _buildCircle({bool isFilled = false}) {
    Color fillColor = isFilled ? const Color(0xFF00ADB5) : Colors.transparent;
    Color borderColor =
    isFilled ? const Color(0xFF00ADB5) : const Color(0xFF00ADB5);
    double borderWidth = 1.0;

    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const NoticeDialog();
          },
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 0,
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF00ADB5),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        side: MaterialStateProperty.all(BorderSide.none),
      ),
      child: const Text(
        "Get Started",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class IntroductionContent {
  final String title;
  final String description;
  final String image;

  IntroductionContent(this.title, this.description, this.image);
}