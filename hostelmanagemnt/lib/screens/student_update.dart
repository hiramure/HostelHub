import 'package:flutter/material.dart';

class StudentUpdate extends StatefulWidget {
  final String studentID;
  const StudentUpdate({Key? key, required this.studentID}) : super(key: key);

  @override
  State<StudentUpdate> createState() => _StudentUpdateState();
}

class _StudentUpdateState extends State<StudentUpdate> {
  @override
  void initstate() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update',
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Center(),
    );
  }
}
