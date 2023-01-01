import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappbc/utils/sizes.dart';

import '../../const/assets_path.dart';

class Intropage2 extends StatelessWidget {
  const Intropage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            onboard1,
          )),
          Text(
            "Perfect Access",
            style: GoogleFonts.encodeSans(
                textStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: heightSize(20),
          ),
          Text(
            "We interview every specialist before\nthey get to work",
            style: GoogleFonts.encodeSans(
                textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            )),
          ),
        ],
      ),
    );
  }
}
