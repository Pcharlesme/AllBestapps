import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:testappbc/views/day8/api.dart';

class HomePageDay8 extends StatefulWidget {
  const HomePageDay8({super.key});

  @override
  State<HomePageDay8> createState() => _HomePageDay8State();
}

String? responseString;
Map? mapResponse;
Map? dataResponse;

class _HomePageDay8State extends State<HomePageDay8> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        // responseString = response.body;
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse!['data'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API DEMO"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 99, 175, 238),
            ),
            child: Center(
                child: mapResponse == null
                    ? const Text("Data is loading")
                    : Text(
                        mapResponse!['data'].toString(),
                      )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 233, 99, 238),
              ),
              child: Center(
                  child: mapResponse == null
                      ? const Text("Data is loading")
                      : Text(
                          mapResponse!['support'].toString(),
                        )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 99, 111, 238),
              ),
              child: Column(
                children: [
                  Center(
                      child: dataResponse == null
                          ? const Text("Data is loading")
                          : Text(
                              dataResponse!['first_name'].toString(),
                            )),
                  Center(
                      child: dataResponse == null
                          ? const Text("Data is loading")
                          : Text(
                              dataResponse!['last_name'].toString(),
                            )),
                  Center(
                      child: dataResponse == null
                          ? const Text("Data is loading")
                          : Text(
                              dataResponse!['email'].toString(),
                            )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const ApiConnect();
                }));
              },
              color: Colors.red,
              child: const Text("NextPage"),
            ),
          )
        ],
      ),
    );
  }
}
