import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var userInfo = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        backgroundColor: const Color.fromARGB(255, 134, 145, 159),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(userInfo.currentUser!.email.toString()).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Placeholder();
        },
      ),
    );
  }
}