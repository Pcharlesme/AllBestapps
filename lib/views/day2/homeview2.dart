import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testappbc/views/day2/intropage1.dart';
import 'package:testappbc/views/day2/intropage2.dart';
import 'package:testappbc/views/day2/intropage3.dart';

class Day2OnboardView extends StatefulWidget {
  const Day2OnboardView({super.key});

  @override
  State<Day2OnboardView> createState() => _Day2OnboardViewState();
}

class _Day2OnboardViewState extends State<Day2OnboardView> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //pageview
          PageView(
            controller: _controller,
            children: [
              Intropage1(),
              Intropage2(),
              Intropage3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.7),
              child: SmoothPageIndicator(controller: _controller, count: 3))
        ],
      ),
    );
  }
}
