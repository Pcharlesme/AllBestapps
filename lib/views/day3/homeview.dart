import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testappbc/utils/sizes.dart';
import 'package:testappbc/views/day3/cart_model.dart';

class GroceryHome3 extends StatelessWidget {
  const GroceryHome3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightSize(40),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Good Morning"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Let's order fresh items for you",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Fresh items",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                  child: Consumer<CartModel>(
                builder: ((context, value, child) => GridView.builder(
                      itemCount: value.shopitem.lenght,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => GridProduct(
                        color: value.shopitem[index][3],
                        imagepath: value.shopitem[index][2],
                        itemprice: value.shopitem[index][1],
                        itemname: value.shopitem[index][0],
                      ),
                    )),
              ))
            ],
          );
        }),
      ),
    );
  }
}

class GridProduct extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final Color color;
  final String imagepath;
  const GridProduct({
    Key? key,
    required this.itemname,
    required this.itemprice,
    required this.color,
    required this.imagepath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        children: [
          Image.asset(
            imagepath,
            height: 64,
          ),
        ],
      ),
    );
  }
}
