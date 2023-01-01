import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappbc/utils/sizes.dart';

import '../../const/assets_path.dart';

class Intropage1 extends StatelessWidget {
  const Intropage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            onboard,
          )),
          Text(
            "Improve Pet Grooming",
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
            "All types of services for your pet in one\n place, instantly searchable",
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
