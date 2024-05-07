import 'package:flutter/material.dart';
import 'package:practiceapi/homescreen.dart';

import 'detailscreen.dart';

void main() {
  runApp(
    const FirstScreen(),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
