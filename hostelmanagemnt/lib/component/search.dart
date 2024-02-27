import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearhScreen extends StatefulWidget {
  const SearhScreen({super.key});

  @override
  State<SearhScreen> createState() => _SearhScreenState();
}

class _SearhScreenState extends State<SearhScreen> {
  List searchResult = [];

  void searchFromFirebaase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Students')
        .where('email', arrayContains: query)
        .get();
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Search'),
              onChanged: (query) {
                searchFromFirebaase(query);
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchResult[index]['register no']),
                    );
                  }))
        ],
      ),
    );
  }
}
