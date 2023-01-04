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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return CartDetails();
          }));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
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
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) => GridProduct(
                        color: value.shopitem[index][3],
                        imagepath: value.shopitem[index][2],
                        itemprice: value.shopitem[index][1],
                        itemname: value.shopitem[index][0],
                        press: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
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

//CART DETAILS

class CartDetails extends StatelessWidget {
  const CartDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              //list of items

              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                              leading: Image.asset(
                                value.cartItems[index][2],
                                height: 38,
                              ),
                              title: Text(value.cartItems[index][0]),
                              subtitle: Text(value.cartItems[index][1]),
                              trailing: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index);
                                },
                              )),
                        ),
                      )),
                ),
              ),
              //total price
              Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Price",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 14,
                            )),
                          ),
                          Text(
                            "\$" + value.calculateTotal(),
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),

                      //pay now

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.shade100)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

//GRID PRODUCT
class GridProduct extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final Color color;
  void Function()? press;
  final String imagepath;
  GridProduct({
    Key? key,
    required this.itemname,
    required this.itemprice,
    required this.color,
    required this.imagepath,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withOpacity(0.9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagepath,
                height: 84,
              ),

              //text item

              Text(itemname),

              //price button

              MaterialButton(
                onPressed: press,
                color: color,
                child: Text(
                  "\$" + itemprice,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
