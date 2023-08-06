import 'package:flutter/material.dart';

class CVTimelineChild extends StatelessWidget {
  const CVTimelineChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28),
      child: Container(
        height: 50,
        color: Colors.grey,
        child: Center(
          child: Text(
            'hororororo',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
