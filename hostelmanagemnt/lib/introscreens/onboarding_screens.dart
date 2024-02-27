import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/introscreens/intro1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro2.dart';
import 'intro3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Intro1(),
              Intro3(),
              Intro2(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: WormEffect(dotColor: Color(0xFFD9E3EA))),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/welcome');
                          },
                          child: Text(
                            '>>',
                            style: TextStyle(fontSize: 28),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                ],
              )),
        ],
      ),
    );
  }
}
