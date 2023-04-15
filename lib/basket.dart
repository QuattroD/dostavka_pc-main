import 'package:dostavka_pc/drawer.dart';
import 'item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPagesState();
}

class _BasketPagesState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 59, 74, 92),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Basket'),
          backgroundColor: const Color.fromARGB(255, 134, 145, 159),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                },
                icon: const Icon(Icons.add_card_outlined))
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(userInfo.currentUser!.email.toString())
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            final snap = snapshot.data!.docs;
            return snap.isEmpty == true
                ? Center(
                    child: InkWell(
                    child: const Text(
                      'Buy something? ಠ_ಠ',
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
                              alignment: Alignment(-0.55, 0),
                              child: Text(
                                snap[index]['title'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection(
                                            user.currentUser!.email.toString())
                                        .doc(snap[index]['title'])
                                        .delete();
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    size: 35,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection(
                                            user.currentUser!.email.toString())
                                        .doc(snap[index]['title'])
                                        .update({
                                      'count': snap[index]['count'] + 1
                                    });
                                  },
                                  icon: const Icon(Icons.add, size: 20)),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {
                                    if (snap[index]['count'] == 1) {
                                      return;
                                    } else {
                                      FirebaseFirestore.instance
                                          .collection(user.currentUser!.email
                                              .toString())
                                          .doc(snap[index]['title'])
                                          .update({
                                        'count': snap[index]['count'] - 1
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove, size: 20)),
                            ),
                            Container(
                                alignment: const Alignment(0.7, 0),
                                child: Text(
                                  snap[index]['count'].toString(),
                                  style: const TextStyle(fontSize: 20),
                                )),
                            Container(
                                alignment: const Alignment(0.4, 0),
                                child: Text(
                                  (snap[index]['price'] * snap[index]['count']).toString() +'₽',
                                  style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
