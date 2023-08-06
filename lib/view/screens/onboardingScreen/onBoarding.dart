import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/loginScreen/elements/customButton.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String?, String?>> splashData = [
    {
      "text": "Create Your\n Portfolio",
      "another text": "No need to worry about \nMaking your website",
      "image": "lib/assets/images/person.png"
    },
    {
      "text": "Increase\n Connections",
      "another text": "Add friends and  \ncommunicate with them.",
      "image": "lib/assets/images/magnet.png"
    },
    {
      "text": "Create Your\n Portfolio",
      "another text": "No need to worry about \nMaking your website",
      "image": "lib/assets/images/person.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, Constraints) => Container(
          margin: EdgeInsets.only(
            left: Constraints.maxWidth * 0.05,
            right: Constraints.maxWidth * 0.03,
            top: Constraints.maxHeight * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top section
              Expanded(
                flex: 6,
                child: PageView.builder(
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashScreen(
                    image: splashData[index]["image"]!,
                    text: splashData[index]["text"]!,
                    anotherText: splashData[index]["another text"]!,
                  ),
                ),
              ),
              // button section
              Expanded(
                flex: 1,
                child: MyButton(
                  myText: 'Next',
                  ontap: () {
                    // Implement the logic for the button press here
                  },
                  left: Constraints.maxWidth * 0.03,
                  top: Constraints.maxHeight * 0.018,
                  bottom: Constraints.maxHeight * 0.03,
                  height: Constraints.maxHeight * 0.077,
                  width: Constraints.maxWidth * 0.86,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  final String text, image, anotherText;
  SplashScreen({
    super.key,
    required this.text,
    required this.image,
    required this.anotherText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
              text: text,
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800),
          Spacer(),
          Center(
            child: Image.asset(
              image,
              height: Constraints.maxHeight * 0.4,
            ),
          ),
          Spacer(),
          MyText(
              text: anotherText,
              color: Color(0xff7e7e7e),
              fontSize: 24,
              fontWeight: FontWeight.w400),
          Spacer()
        ],
      ),
    );
  }
}
