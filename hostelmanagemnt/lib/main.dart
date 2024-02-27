import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/introscreens/onboarding_screens.dart';
import 'package:hostelmanagemnt/screens/add_user.dart';
import 'package:hostelmanagemnt/screens/admin_homepage.dart';
import 'package:hostelmanagemnt/screens/notices.dart';
import 'package:hostelmanagemnt/screens/show_students.dart';
import 'package:hostelmanagemnt/screens/student_notice_board.dart';
import 'package:hostelmanagemnt/screens/student_profile.dart';
import 'package:hostelmanagemnt/screens/welcome_screen.dart';

import 'component/search.dart';
import 'firebase_options.dart';

void main() async {
  runApp(App());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/addUser': (context) => AddUser(),
          '/adminHome': (context) => AdminHome(),
          '/notice': (context) => Notice(),
          '/allStudent': (context) => ShowStudents(),
          '/noticeForStudent': (context) => StudentNoticeBoard(),
          '/welcome': (context) => WelcomeScreen(),
          '/studentProfile': (context) => StudentProfilePage(),
          '/search': (context) => SearhScreen(),
        },
        home: OnBoardingScreen());
  }
}
