import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/loginScreen/elements/customButton.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: LayoutBuilder(
                builder: (context, Constraints) => Container(
                    margin: EdgeInsets.only(
                        left: Constraints.maxWidth * 0.05,
                        right: Constraints.maxWidth * 0.03,
                        top: Constraints.maxHeight * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: PageView.builder(
                            itemBuilder: (context, index) => OnboardingContent(
                              description: 'huhu description here',
                              image: 'lib/assets/images/person.png',
                              title: 'Hahahahaha',
                            ),
                          ),
                        ),
                        MyButton(
                            ontap: () {},
                            bottom: Constraints.maxHeight * 0.03,
                            height: Constraints.maxHeight * 0.077,
                            left: Constraints.maxWidth * 0.01,
                            myText: 'Next',
                            width: Constraints.maxWidth * 0.86,
                            top: Constraints.minHeight * 0.018)
                      ],
                    )))));
  }
}

class OnboardingContent extends StatelessWidget {
  final String title, image, description;
  OnboardingContent({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
              text: title,
              color: Colors.white,
              fontSize: 62,
              fontWeight: FontWeight.w800),
          Spacer(),
          Image.asset(
            image,
            height: Constraints.maxHeight * 0.4,
          ),
          Spacer(),
          MyText(
              text: description,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal),
          Spacer()
        ],
      ),
    );
  }
}
