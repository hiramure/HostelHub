import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFFFEF4EB),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'H O S T E L H U B',
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Color(0xFF5F544E)),
                ),
                Text(
                  "Home is where the login is.",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Color(0xFF5F544E)),
                ),
                Text("Welcome to your virtual hostel haven.",
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Color(0xFF5F544E)))
              ],
            ),
          ),
          Builder(builder: (context) {
            return OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return LoginPage();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "LOGIN",
                ),
              ),
              style: OutlinedButton.styleFrom(
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                foregroundColor: Color(0xFFFAA678),
                side: BorderSide(width: 3, color: Color(0xFFFAA678)),
              ),
            );
          }),
          Container(
            width: 450,
            height: 450,
            child: Image(
              image: AssetImage("assets/images/Welcome_image.jpeg"),
            ),
          ),
          Container(
              child: Column(
            children: [],
          ))
        ]),
      ),
    );
  }
}
