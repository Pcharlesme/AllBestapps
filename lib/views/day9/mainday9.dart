import 'package:flutter/material.dart';

import '../../utils/route.dart';

class ShopX extends StatefulWidget {
  const ShopX({super.key});

  @override
  State<ShopX> createState() => _ShopXState();
}

class _ShopXState extends State<ShopX> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.arrow_back),
          actions: const [Icon(Icons.shop)],
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            GridView.builder(
              itemCount: 30,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.day3Route);
                  },
                  child: Container(
                    color: Colors.blue.shade700,
                    child: const Center(child: Text("Day 1")),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
