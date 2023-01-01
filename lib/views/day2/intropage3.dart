import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappbc/utils/sizes.dart';

import '../../const/assets_path.dart';

class Intropage3 extends StatelessWidget {
  const Intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            onboard2,
          )),
          Text(
            "Reliable Services",
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
            "A review can be left only by a user\nwho used the service",
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
