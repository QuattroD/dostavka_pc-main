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
        stream: FirebaseFirestore.instance.collection('history-'+userInfo.currentUser!.email.toString()).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        var snap = snapshot.data!.docs;
          return snap.isEmpty == true
                ? Center(
                    child: InkWell(
                    child: const Text(
                      'Basket is empty ಥ_ಥ',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/shop');
                    },
                  ))
          : ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 2),
                                blurRadius: 10,
                              )
                            ]),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              alignment: const Alignment(-0.55, 0),
                              child: Text(
                                snap[index]['title'] + ' ' + snap[index]['count'].toString() + 'x ' + 'Price:' + (snap[index]['price'] * snap[index]['count']).toString(),
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

        },
      ),
    );
  }
}