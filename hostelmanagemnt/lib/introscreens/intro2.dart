import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro1State();
}

class _Intro1State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color(0xFFE89D91),
    //   body: Center(
    //     child: Lottie.network(
    //         'https://lottie.host/1557c423-13b0-432b-8c76-6451786826d7/WItWb0zgsG.json'),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Color(0xFFC1ACCB),
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
                    'Customize your profile, ',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF582F6B)),
                  ),
                  Text(
                    'make it uniquely yours in the tapestry of student life',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 15, color: Color(0xFF582F6B)),
                  )
                ],
              ),
            ),
            Lottie.network(
                'https://lottie.host/6abc3121-be8e-4aa1-a598-3c090e18863c/FWCogvKYTz.json'),
          ],
        ),
      ),
    );
  }
}
