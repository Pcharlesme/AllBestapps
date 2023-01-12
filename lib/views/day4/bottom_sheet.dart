import 'package:flutter/material.dart';

class BotttomSheet extends StatelessWidget {
  const BotttomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text("Modal Bottom Sheet")),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text("share link"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Divider(
                                  height: 1,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  title: Text("Remove from List"),
                                  onTap: () {
                                    final snackbar = SnackBar(
                                      content: Text("Removed from List"),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.link),
                                  title: Text("Copy link"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        ));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        colors: [Colors.redAccent, Colors.orangeAccent])),
                child: const Text('Show Bottom Sheet'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
