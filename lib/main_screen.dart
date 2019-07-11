import 'package:flutter/material.dart';

import 'arc_clipper.dart';
import 'bubbles_slide.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * .35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade200,
                      Colors.blue.shade800,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Image.asset(
                  'assets/america.png',
                  fit: BoxFit.contain,
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .25,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: BubblesSlide(),
          ),
        ],
      ),
    );
  }
}
