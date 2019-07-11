import 'dart:ui';

import 'package:bubbles_experiment/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'data.dart';
import 'time_card.dart';

class BubblesSlide extends StatefulWidget {
  @override
  _BubblesSlideState createState() => _BubblesSlideState();
}

class _BubblesSlideState extends State<BubblesSlide> {
  PageController _pageController;
  int _selectedBubble;
  double _pageChange;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: .45,
      initialPage: 1,
    )..addListener(() {
        setState(() {
          _pageChange = _pageController.page;
        });
      });

    _selectedBubble = _pageController.initialPage;
    _pageChange = _selectedBubble * 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * .35,
            child: PageView.builder(
              controller: _pageController,
              pageSnapping: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (int page) =>
                  setState(() => _selectedBubble = page),
              itemCount: CitiesData.cities.length,
              itemBuilder: (BuildContext context, int index) {
                return Bubble(
                  label: CitiesData.cities[index].city,
                  index: index,
                  pageChange: _pageChange,
                  image: CitiesData.cities[index].iconAsset,
                  onTap: () {
                    _goTo(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            key: UniqueKey(),
            child: TimeCard(
              city: CitiesData.cities[_selectedBubble],
            ),
          ),
        ],
      );
    });
  }

  void _goTo(int page) {
    _pageController.animateToPage(
      page,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 350),
    );
  }
}

class Bubble extends StatelessWidget {
  final int index;
  final String label;
  final VoidCallback onTap;
  final double pageChange;
  final String image;

  Bubble({
    @required this.label,
    @required this.index,
    @required this.pageChange,
    this.image,
    this.onTap,
  });

  double get _size => _lerp(120, 100).clamp(100.0, 120.0);
  double get _delta => index - pageChange;

  double _lerp(a, b) {
    double _value = lerpDouble(a, b, _delta.abs());
    if (pageChange.isNegative) {
      return _value * -1;
    } else {
      return _value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: Offset(0.0, _lerp(0.0, .15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: (onTap != null) ? onTap : null,
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              elevation: _lerp(10.0, 4.0).clamp(4.0, 10.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: _size,
                width: _size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: (image != null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10000),
                        child: Image.asset(
                          image,
                          color: Colors.blueGrey
                              .withOpacity(_lerp(.9, 0.2).clamp(0.0, .9)),
                          fit: BoxFit.none,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
          ),
          SizedBox(height: _lerp(32, 16.0).clamp(16.0, 32.0)),
          Text(
            label,
            style: TextStyle(
              fontSize: _lerp(26, 20.0),
              letterSpacing: _lerp(2.0, 0.0),
              color: Colors.blueGrey,
              fontWeight: (_delta == 0) ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
