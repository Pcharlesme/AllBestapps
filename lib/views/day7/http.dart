import 'package:flutter/material.dart';
import 'package:testappbc/views/day7/base_client.dart';
import 'package:testappbc/views/day7/user.dart';

class HttpApi extends StatefulWidget {
  const HttpApi({super.key});

  @override
  State<HttpApi> createState() => _HttpApiState();
}

class _HttpApiState extends State<HttpApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppButton(
            description: 'Fetch User',
            press: () async {
              var response =
                  await BaseClient().get('/users').catchError((err) {});
              if (response == null) return;
              debugPrint('Successful');

              var users = userFromJson(response);
              debugPrint('Users count: ${users.length}');
            },
            text: 'GET',
            textcolor: Colors.deepOrangeAccent,
          ),
          AppButton(
            description: 'Add User',
            press: () async {
              var user = User(
                name: 'Emmanuel Charles',
                qualifications: [
                  Qualification(degree: 'Master', completionData: '01-01-2025'),
                ],
              );

              var response =
                  await BaseClient().post('/users', user).catchError((err) {});
              if (response == null) return;
              debugPrint('successful:');
            },
            text: 'POST',
            textcolor: const Color.fromARGB(255, 89, 8, 240),
          ),
          AppButton(
            description: 'Edit User',
            press: () async {
              var id = 2;
              var user = User(
                name: 'Afzal Ali',
                qualifications: [
                  Qualification(degree: 'Ph.D', completionData: '01-01-2028'),
                ],
              );

              var response = await BaseClient()
                  .put('/users/$id', user)
                  .catchError((err) {});
              if (response == null) return;
              debugPrint('successful:');
            },
            text: 'PUT',
            textcolor: const Color.fromARGB(255, 2, 79, 18),
          ),
          AppButton(
            description: 'Delete User',
            press: () async {
              var id = 2;
              var response =
                  await BaseClient().delete('/users/$id').catchError((err) {});
              if (response == null) return;
              debugPrint('successful:');
            },
            text: 'DEL',
            textcolor: const Color.fromARGB(255, 115, 2, 60),
          ),
        ],
      )),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final Color textcolor;
  final VoidCallback press;
  final String description;

  const AppButton({
    Key? key,
    required this.text,
    required this.textcolor,
    required this.press,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 56,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 15, 1, 52),
                    fontSize: 18,
                    letterSpacing: 2.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
