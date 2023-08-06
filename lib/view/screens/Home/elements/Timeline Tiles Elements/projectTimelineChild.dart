import 'package:flutter/material.dart';

class ProjectTimelineChild extends StatelessWidget {
  const ProjectTimelineChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28),
      child: Container(
        height: 50,
        color: Colors.grey,
        child: Center(
          child: Text(
            'gomu gomuno',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
