import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Time Tab", style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
