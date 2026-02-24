import "package:flutter/material.dart";


class GradientContainer extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final Widget screen;

  const GradientContainer({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.screen,
  });


  @override
  Widget build(context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [startColor, endColor],
            ),
          ),
           child: screen
        );
  }
}