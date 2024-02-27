import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signIn() async {
    // String enterEmail = emailController.text.trim();
    // String enterPassword = passwordController.text.trim();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      if (emailController.text.trim() == 'admin@gmail.com' &&
          passwordController.text.trim() == 'admin123') {
        Navigator.pushNamed(context, '/adminHome');
      } else {
        Navigator.pushNamed(context, '/noticeForStudent');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Authentication failed';

      if (e.code == 'user-not-found') {
        errorMessage = 'User not found. Please check your email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
      }

      Fluttertoast.showToast(msg: errorMessage, gravity: ToastGravity.BOTTOM);
      // Handle registration failure, e.g., display an error message to the user
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF7AD0CB),
            Color(0xFF8ED1CD),
            Color(0xFFA6D6DA),
            Color(0xFFD2EBE7),
            // Color(0xFFD7EDEA),
            Color(0xFFFFFFFF)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 270,
                  height: 270,
                  child: Image(
                      image: AssetImage(
                    "assets/images/login_image.jpeg",
                  )),
                ),
                Text(
                  "Welcome Back!",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Color(0xFF906658),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  "Home is where the heart is, ",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Color(0xFF906658),
                      ),
                ),
                Text(
                  "and your hostel journey begins here. ",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Color(0xFF906658),
                      ),
                ),
                Form(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Color(0xFF44D3CF),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color(0xFF79C2C2),
                              ),
                              labelText: "Email",
                              hintText: "Email",
                              border: InputBorder.none,
                              fillColor: Colors.white.withOpacity(0.3),
                              labelStyle: TextStyle(
                                  color: Color(0xFF79C2C2), fontSize: 18),
                              hintStyle: TextStyle(color: Color(0xFFBCE2E3))),
                          style:
                              TextStyle(color: Color(0xFF0E777A), fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          obscureText: hidden,
                          controller: passwordController,
                          cursorColor: Color(0xFF44D3CF),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Color(0xFF79C2C2),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidden = !hidden;
                                  });
                                },
                                icon: hidden
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Color(0xFF79C2C2),
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Color(0xFF79C2C2),
                                      ),
                              ),
                              labelText: "Password",
                              hintText: "Password",
                              border: InputBorder.none,
                              fillColor: Colors.white.withOpacity(0.3),
                              labelStyle: TextStyle(
                                  color: Color(0xFF79C2C2), fontSize: 18),
                              hintStyle: TextStyle(color: Color(0xFF9DDDDF))),
                          style:
                              TextStyle(color: Color(0xFF0E777A), fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: signIn,
                            // if (emailController.text  == 'admin' &&
                            //     passwordController.text == 'admin') {
                            //   Navigator.pushNamed(context, '/adminHome');
                            // } else if(){
                            //
                            //
                            // }
                            // else {
                            //   setState(() {
                            //     errorMessage = 'Invalid username or password';
                            //   });
                            // }

                            // } else {
                            //   setState(() {
                            //     errorMessage = 'Invalid username or password';
                            //   });
                            // }
                            // Navigator.of(context)
                            //     .pushReplacementNamed('/addUser');

                            child: Text(
                              "LOGIN",
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFBDC4E3),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          );
                        }),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
