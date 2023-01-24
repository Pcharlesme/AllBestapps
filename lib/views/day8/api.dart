import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConnect extends StatefulWidget {
  const ApiConnect({super.key});

  @override
  State<ApiConnect> createState() => _ApiConnectState();
}

String? responseString;
Map? mapResponse;
Map? dataResponse;
List? listResponse;

class _ApiConnectState extends State<ApiConnect> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?/page=2"));
    if (response.statusCode == 200) {
      setState(() {
        // responseString = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['data'];
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
        body: ListView.builder(
            itemCount: listResponse == null ? 0 : listResponse!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          listResponse![index]['avatar'],
                        ),
                      ),
                      Text(
                        listResponse![index]['email'].toString(),
                      ),
                      Text(listResponse![index]['first_name'].toString()),
                      Text(listResponse![index]['last_name'].toString()),
                      Text(listResponse![index]['id'].toString()),
                    ],
                  ),
                ),
              );
            }));
  }
}
