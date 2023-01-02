import 'package:flutter/material.dart';
import 'package:testappbc/const/colors.dart';
import 'package:testappbc/utils/route.dart';
import 'package:testappbc/utils/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "APP CHALLEGES",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: heightSize(30),
          ),
          const Expanded(child: DaysGridView()),
        ],
      ),
    );
  }
}

class DaysGridView extends StatelessWidget {
  const DaysGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 3,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
    );
  }
}
