import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testappbc/const/assets_path.dart';
import 'package:testappbc/views/day3/cart_model.dart';
import 'package:testappbc/views/day3/homeview.dart';

class IntroGrocery extends StatelessWidget {
  const IntroGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraint) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(onboard1),
              ),
              Text("We deliver groceries at your doorstep",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )),

              const Text("Fresh Item Everywhere"),

              const Spacer(),

              //get started
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const GroceryHome3();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.purpleAccent),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Get Started"),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
