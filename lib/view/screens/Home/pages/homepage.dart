import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      return SafeArea(
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Constraints.maxHeight * 0.15,
            ),
            Center(
              child: Container(
                height: Constraints.maxHeight * 0.2,
                decoration: BoxDecoration(
                    color: Color(0xff434343),
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'lib/assets/images/Mask group (1).png',
                      height: Constraints.maxHeight * 0.17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      );
    });
  }
}
