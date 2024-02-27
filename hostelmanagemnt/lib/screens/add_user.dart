import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/screens/show_students.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool hidden = true;
  TextEditingController roomNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController regNoController = TextEditingController();

  Future signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ShowStudents()),
      );

      addUserDetails(
          fullnameController.text.trim(),
          emailController.text.trim(),
          phonenoController.text.trim(),
          passwordController.text.trim(),
          roomNoController.text.trim(),
          regNoController.text.trim());
    } on FirebaseAuthException catch (e) {
      print('User registration failed: ${e.message}');
      // Handle registration failure, e.g., display an error message to the user
    }
  }

  Future addUserDetails(String fullname, String email, String phoneNo,
      String password, String roomNo, String regNo) async {
    await FirebaseFirestore.instance.collection('Students').doc(email).set({
      'full name': fullname,
      'email': email,
      'phone no': phoneNo,
      'password': password,
      'room no': roomNo,
      'register no ': regNo,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFFEBA9AA),
        elevation: 0.0,
        title: Text(
          'Add Student ',
          style: TextStyle(
            color: Color(0xFF001B4A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                  colors: [Color(0xFF8794A5), Color(0xFF9AA3AF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFEBA9AA),
              Color(0xFFF4C8BD),
              Color(0xFFF9D3CA),
              Color(0xFFF5D7CC),
              Color(0xFFFCEAD2),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Form(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                  cursorColor: Color(0xFF905044),
                                  controller: fullnameController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_2_outlined,
                                        color: Color(0xFFCB8C7D),
                                      ),
                                      labelText: "Full name",
                                      hintText: "Full name",
                                      border: InputBorder.none,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      labelStyle:
                                          TextStyle(color: Color(0xFFCB8C7D)),
                                      hintStyle:
                                          TextStyle(color: Color(0xFFEAAA75))),
                                  style: TextStyle(
                                      color: Color(0xFFC56954), fontSize: 18),
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
                                  cursorColor: Color(0xFF905044),
                                  controller: regNoController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.confirmation_number,
                                        color: Color(0xFFCB8C7D),
                                      ),
                                      labelText: "Reg No",
                                      hintText: "Reg No",
                                      border: InputBorder.none,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      labelStyle:
                                          TextStyle(color: Color(0xFFCB8C7D)),
                                      hintStyle:
                                          TextStyle(color: Color(0xFFEAAA75))),
                                  style: TextStyle(
                                      color: Color(0xFFC56954), fontSize: 18),
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
                                  cursorColor: Color(0xFF905044),
                                  controller: roomNoController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.numbers_rounded,
                                        color: Color(0xFFCB8C7D),
                                      ),
                                      labelText: "Room No",
                                      hintText: "Room No",
                                      border: InputBorder.none,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      labelStyle:
                                          TextStyle(color: Color(0xFFCB8C7D)),
                                      hintStyle:
                                          TextStyle(color: Color(0xFFEAAA75))),
                                  style: TextStyle(
                                      color: Color(0xFFC56954), fontSize: 18),
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
                                  cursorColor: Color(0xFF905044),
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: Color(0xFFCB8C7D),
                                      ),
                                      labelText: "Email",
                                      hintText: "Email",
                                      border: InputBorder.none,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      labelStyle:
                                          TextStyle(color: Color(0xFFCB8C7D)),
                                      hintStyle:
                                          TextStyle(color: Color(0xFFEAAA75))),
                                  style: TextStyle(
                                      color: Color(0xFFC56954), fontSize: 18),
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
                                  cursorColor: Color(0xFF905044),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline_rounded,
                                        color: Color(0xFFCB8C7D),
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
                                                color: Color(0xFFCB8C7D),
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: Color(0xFFCB8C7D),
                                              ),
                                      ),
                                      labelText: "Password",
                                      hintText: "Password",
                                      border: InputBorder.none,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      labelStyle: TextStyle(
                                          color: Color(0xFFCB8C7D),
                                          fontSize: 18),
                                      hintStyle:
                                          TextStyle(color: Color(0xFFEAAA75))),
                                  style: TextStyle(
                                      color: Color(0xFFC56954), fontSize: 18),
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
                                  cursorColor: Color(0xFF905044),
                                  controller: phonenoController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Color(0xFFCB8C7D),
                                      ),
                                      labelText: "Phone No",
                                      hintText: "Phone No",
                                      border: InputBorder.none,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      labelStyle:
                                          TextStyle(color: Color(0xFFCB8C7D)),
                                      hintStyle:
                                          TextStyle(color: Color(0xFFEAAA75))),
                                  style: TextStyle(
                                      color: Color(0xFFC56954), fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: signUp,
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFCCCCCC),
                                  ),
                                  child: Text(
                                    "Confirm Registration",
                                    style: TextStyle(
                                      fontSize:
                                          18, // Choose your desired font size
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.15,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Image(
                        image: AssetImage("assets/images/Signup_image.jpeg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
