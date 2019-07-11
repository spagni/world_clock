import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Clock',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}
