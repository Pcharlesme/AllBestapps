import 'package:flutter/material.dart';

import 'package:testappbc/views/day9/productmodel.dart';

class ProductBox extends StatelessWidget {
  final Product product;
  const ProductBox({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.blue),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.favorite_rounded),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 90,
              child: Image.network(
                product.imageLink,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.rating.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.white,
                ),
              ],
            ),
            Text('\$${product.price}',
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
