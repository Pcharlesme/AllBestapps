import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  //keep track on the page

  bool onnLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //pageview
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onnLastPage = (index == 2);
              });
            },
            children: const [
              Intropage1(),
              Intropage2(),
              Intropage3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.encodeSans(
                          textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      )),
                    ),
                  ),

                  //dot indicator
                  SmoothPageIndicator(controller: _controller, count: 3),
//nnext or Done

                  onnLastPage
                      ? GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.encodeSans(
                                textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            )),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            "Next",
                            style: GoogleFonts.encodeSans(
                                textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            )),
                          ),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
