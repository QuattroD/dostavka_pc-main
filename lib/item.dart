import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<String> basketuser = <String>[];
var user = FirebaseAuth.instance;

class ItemPages extends StatefulWidget {
  const ItemPages({super.key});

  @override
  State<ItemPages> createState() => _ItemPagesState();
}

class _ItemPagesState extends State<ItemPages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('ItemsShop').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
        var snap = snapshot.data!.docs;
        return ListView.builder(
          itemBuilder: (context, index) {
            return GFCard(
              elevation: 10,
              boxFit: BoxFit.fill,
              titlePosition: GFPosition.start,
              image: Image.network(snap[index]['img'],
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill),
              content: Text(
                snap[index]['title'],
                style: const TextStyle(fontSize: 20),
              ),
              showImage: true,
              buttonBar: GFButtonBar(
                children: <Widget>[
                  GFButton(
                    onPressed: () {
                      setState(() {
                        basketuser.length;
                      });
                      basketuser.add(snap[index]['title']);

                      FirebaseFirestore.instance
                          .collection(user.currentUser!.email.toString())
                          .doc(snap[index]['title'])
                          .set({
                        'description': snap[index]['description'],
                        'count': snap[index]['count'],
                        'price': snap[index]['price'],
                        'title': snap[index]['title'],
                      });
                    },
                    text: 'Add',
                    color: const Color.fromARGB(255, 134, 145, 159),
                  ),
                  GFButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ClipRRect(
                                child: Container(
                              color: const Color.fromARGB(255, 134, 145, 159),
                              height: 400,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                  ),
                                  Text(
                                    'Name product:' +
                                        ' ' +
                                        snap[index]['title'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                  ),
                                  Text(
                                    'Price: ${snap[index]['price']}₽',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                  ),
                                  Text(
                                    'Description:' +
                                        ' ' +
                                        snap[index]['description'].toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ));
                          });
                    },
                    text: 'Info',
                    color: const Color.fromARGB(255, 134, 145, 159),
                  ),
                ],
              ),
            );
          },
          itemCount: snap.length,
        );
      },
    );
  }
}
