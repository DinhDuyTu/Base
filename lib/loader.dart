import 'dart:math';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animationRotation;
  Animation<double> animationRadiusIn;
  Animation<double> animationRadiusOut;

  final double initialRadius = 20.0;

  double radius = 0.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));

    animationRotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animationRadiusIn = Tween<double> (
      begin: 1.0,
      end: 0.0
    ).animate(CurvedAnimation(parent: controller, curve: Interval(
        0.75, 1.0, curve: Curves.elasticIn)));

    animationRadiusOut = Tween<double> (
        begin: 0.0,
        end: 1.0
    ).animate(CurvedAnimation(parent: controller, curve: Interval(
        0.0, 0.25, curve: Curves.elasticOut)));
    
    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animationRadiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animationRadiusOut.value * initialRadius;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 20.0,
                color: Colors.black12,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi/4), radius * sin(pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.blue,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi/2), radius * sin(pi/2)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(3*pi/4), radius * sin(3*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.amber,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi), radius * sin(pi)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.green,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(5*pi/4), radius * sin(5*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.pink,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(3*pi/2), radius * sin(3*pi/2)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.deepPurple,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(7*pi/4), radius * sin(7*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.tealAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(2*pi), radius * sin(2*pi)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}
