import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Lottie.network(
    //         'https://lottie.host/fb3b54c1-a265-4b4d-9ca7-3c410ee12918/kTk2X65NoY.json'),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Color(0xFFF4CEC5),
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
                    'Navigating success, Shaping futures  ',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Welcome to student management',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            Lottie.network(
                'https://lottie.host/81779513-6be1-492f-a48d-499757cdb25c/FMgDQLtcCK.json'),
          ],
        ),
      ),
    );
  }
}
