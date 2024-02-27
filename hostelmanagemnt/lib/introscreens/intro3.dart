import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro3 extends StatefulWidget {
  const Intro3({super.key});

  @override
  State<Intro3> createState() => _Intro1State();
}

class _Intro1State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB4E8D0),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            SizedBox(
              height: 230,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Stay informed, Stay connected ',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF5C9E8F)),
                  ),
                  Text(
                    'Important notices from the admin await you',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 15, color: Color(0xFF45796D)),
                  )
                ],
              ),
            ),
            Lottie.network(
                'https://lottie.host/c76cc5b9-602d-4254-9407-74f4b3e1fa3c/nBbtHQXFb0.json'),
          ],
        ),
      ),
    );
  }
}
