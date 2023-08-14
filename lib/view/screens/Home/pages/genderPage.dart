import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, Constraints) => Container(
                margin: EdgeInsets.only(
                    left: Constraints.maxWidth * 0.04,
                    right: Constraints.maxWidth * 0.04,
                    top: Constraints.maxHeight * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: 'Gender',
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: Constraints.maxHeight * 0.02,
                    ),
                    MyText(
                        text: 'Select your gender.',
                        color: Color(0xff7e7e7e),
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                    SizedBox(
                      height: Constraints.maxHeight * 0.15,
                    ),
                    Row(
                      children: [
                        ///////////////////////////////////////////////////////
                        Container(
                          height: Constraints.maxHeight * 0.2,
                          decoration: BoxDecoration(
                              color: Color(0xff323232),
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'lib/assets/images/male.png',
                                height: Constraints.maxHeight * 0.1,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        ////////////////////////////////////////////////////
                        Container(
                          height: Constraints.maxHeight * 0.2,
                          decoration: BoxDecoration(
                              color: Color(0xff323232),
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'lib/assets/images/female.png',
                                height: Constraints.maxHeight * 0.1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Constraints.maxHeight * 0.02,
                    ),
                    Row(
                      children: [
                        MyText(
                            text: 'Male',
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w600),
                        Spacer(),
                        MyText(
                            text: 'Female',
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    SizedBox(
                      height: Constraints.maxHeight * 0.03,
                    ),
                    Center(
                      child: Container(
                        height: Constraints.maxHeight * 0.2,
                        decoration: BoxDecoration(
                            color: Color(0xff323232),
                            borderRadius: BorderRadius.circular(14)),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'lib/assets/images/others.png',
                              height: Constraints.maxHeight * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Constraints.maxHeight * 0.02,
                    ),
                    Center(
                      child: MyText(
                          text: 'Others',
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )),
    );
  }
}
