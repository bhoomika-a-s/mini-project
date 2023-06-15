import 'package:flutter/material.dart';
import 'package:mini_project/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn'; // shared prefernce variable
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mini-project',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 84, 43, 3),
      ),
      home: const ScreenSplash(),
    );
  }
}