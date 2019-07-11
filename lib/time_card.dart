import 'package:flutter/material.dart';

import 'data.dart';
import 'time_helper.dart';

class TimeCard extends StatefulWidget {
  final City city;

  TimeCard({
    @required this.city,
  }) : assert(city != null);

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 32.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          gradient: LinearGradient(
            colors: [
              Colors.amber.shade200,
              Colors.amber.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                TimeHelper.getTimeFromCity(widget.city.timeZone),
                style: TextStyle(
                  fontSize: 100.0,
                  color: Colors.white.withOpacity(.8),
                ),
              ),
              Text(
                (widget.city.timeZone.isNegative)
                    ? 'GMT ${widget.city.timeZone}'
                    : 'GMT +${widget.city.timeZone}',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white.withOpacity(.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
