import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFD0E6A5),
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.person_2_rounded,
            color: Color(0xFF4A6A0A),
            size: 60,
          )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color(0xFF5B7D17),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/welcome');
                  },
                  title: Text(
                    'H O M E',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Color(0xFF5B7D17)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person_2,
                    color: Color(0xFF5B7D17),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/studentProfile');
                  },
                  title: Text(
                    'P R O F I L E',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Color(0xFF5B7D17)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Color(0xFF5B7D17),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
              title: Text(
                'L O G O U T',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Color(0xFF5B7D17)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
