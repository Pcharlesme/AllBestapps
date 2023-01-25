import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testappbc/views/day9/productmodel.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 330,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.imageLink,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.favorite_rounded),
                            onPressed: () {},
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              Text('\$${product.price}',
                  style: const TextStyle(
                    fontSize: 32,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
