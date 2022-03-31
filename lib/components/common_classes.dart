import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animation/constant/constant_page.dart';
import 'package:flutter_animation/constant/number_ratio.dart';


class CardSlider extends StatefulWidget {

  const CardSlider({
    Key? key,
  }) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> with TickerProviderStateMixin {


  late AnimationController _animationController;
  late Animation<double> _animationBackgroundIn;


  void _animationExecution() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration( milliseconds: 500));


    _animationBackgroundIn = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn));


    _animationController.forward();
  }


  @override
  void initState() {
    _animationExecution();
    super.initState();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Transform.rotate(
            angle: pi / -20 * _animationBackgroundIn.value,
            child: Transform.rotate(
              angle: pi / 20,
              child: Padding(
                  padding: EdgeInsets.only(
                    top: height / thirtyTwoPixelRatioH,
                    bottom: height / thirtyTwoPixelRatioH,
                    left: width / thirtyTwoPixelRatioW,
                    right: width / thirtyTwoPixelRatioW,
                  ),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      height: height / 1.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [brandColorDeep, brandColorLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                     //declare your widget here
                    ),
                  ),
                ),
            ),
          );
        });
  }
}
