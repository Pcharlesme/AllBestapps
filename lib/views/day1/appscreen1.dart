import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappbc/const/assets_path.dart';
import 'package:testappbc/const/colors.dart';
import 'package:testappbc/utils/sizes.dart';

class DayOneView extends StatelessWidget {
  const DayOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary.withOpacity(0.2),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black87,
              ))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Find Your",
              style: GoogleFonts.asap(
                textStyle: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Inspiration",
              style: GoogleFonts.asap(
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(244, 243, 252, 255),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search anything youre looking for",
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      )),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "PromoCard",
              style: GoogleFonts.asap(
                textStyle: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: heightSize(200),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  promoCard(day1one),
                  promoCard(day1two),
                  promoCard(day1three),
                  promoCard(day1four),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(day1three)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, stops: [
                      0.2,
                      0.9
                    ], colors: [
                      Colors.black.withOpacity(.8),
                      Colors.blue.withOpacity(.2),
                    ]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Pcharles Best Design",
                        style: GoogleFonts.asap(
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}

Widget promoCard(Image) {
  return AspectRatio(
    aspectRatio: 2.2 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(Image)),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.2,
              0.9
            ], colors: [
              Colors.black.withOpacity(.8),
              Colors.blue.withOpacity(.1),
            ])),
      ),
    ),
  );
}
