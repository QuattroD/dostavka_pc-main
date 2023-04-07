import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<String> basketuser = <String>[];
List<String> test = <String>[];

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
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      final snap = snapshot.data!.docs;
      return ListView.builder(
        itemBuilder: (context, index) {
          return GFCard( 
            elevation: 10,
            boxFit: BoxFit.fill,
            titlePosition: GFPosition.start,
            image: Image.network(
              snap[index]['img'],
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill
              ),
            content: Text(
              snap[index]['title'],
              style: const TextStyle(
                fontSize: 20
              ),),
            showImage: true,
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    setState(() {
                      basketuser.length;
                    });
                    basketuser.add(snap[index]['title']); 
                    FirebaseFirestore.instance.collection(user.currentUser!.email.toString()).doc(snap[index]['title']).set(
                    {
                      'id': snap[index]['id'],
                      'count': snap[index]['count'] + 1,
                      'Connectors': snap[index]['Connectors'],
                      'Features': snap[index]['Features'],
                      'Memory': snap[index]['Memory'],
                      'Interface': snap[index]['Interface'],
                      'Nutrition': snap[index]['Nutrition'],
                      'Techproccesor': snap[index]['Techproccesor'],
                      'price': snap[index]['price'],
                      'title': snap[index]['title'],
                    }
                  );
                  },
                  text: 'Add',
                  color: const Color.fromARGB(255, 59, 158, 162),
                ),
                GFButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ClipRRect(
                          // borderRadius: const BorderRadius.only(
                          //       topLeft: Radius.circular(25),
                          //       topRight: Radius.circular(25)
                          //   ),
                          child: Container(                          
                            color: const Color.fromARGB(255, 59, 158, 162),
                            height: 400,
                              child: Column(
                                children: [
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Name product:' + ' ' +  snap[index]['title'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'VideoChipset:' + ' ' +  snap[index]['VideoChipset'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Interface:' + ' ' +  snap[index]['Interface'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Memory:' + ' ' +  snap[index]['Memory'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Nutrition:' + ' ' +  snap[index]['Nutrition'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Techproccesor:' + ' ' +  snap[index]['Techproccesor'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Connectors:' + ' ' +  snap[index]['Connectors'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Features:' + ' ' +  snap[index]['Features'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Container(margin: const EdgeInsets.only(top: 12),),
                                  Text(
                                    'Price:' + ' ' +  snap[index]['price'].toString() + '₽',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                ],
                              ),                                                   
                          )
                        );
                      }
                    );
                  },
                  text: 'Info',
                  color: const Color.fromARGB(255, 59, 158, 162),
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

class Item {
  int? id;
  String? title;
  String? discription;
  int? price;
  String? img;
  Item({this.id, this.title, this.discription, this.price, this.img});
}

List<Item> itemList = [
  Item(
    id: 1,
    title: 'RTX 3060 Palit',
    price: 40000,
    img: 'https://i.pcmag.com/imagery/roundups/03IN5Ry7Nys41YSqJtZcQSr-1.1607129333.fit_lim.size_1200x630.jpg',
    discription: 'test',
  ),
  Item(
    id: 2,
    title: 'GTX 1660 Palit',
    price: 30000,
    img: 'https://www.kitguru.net/wp-content/uploads/2019/10/featured-1.jpg',
    discription: 'test',
  ),
  Item(
    id: 3,
    title: 'RX 580',
    price: 29000,
    img: 'https://ru.gecid.com/data/video/201902150800-55142/img/09_amd_radeon_rx_590.jpg',
    discription: 'test',
  ),
  Item(
    id: 4,
    title: 'GTX 1660 Palit',
    price: 40000,
    img: 'https://www.kitguru.net/wp-content/uploads/2019/10/featured-1.jpg',
    discription: 'test',
  ),
  Item(
    id: 5,
    title: 'RX 580',
    price: 29000,
    img: 'https://ru.gecid.com/data/video/201902150800-55142/img/09_amd_radeon_rx_590.jpg',
    discription: 'test',
  ),
  Item(
    id: 6,
    title: 'GTX 1660 Palit',
    price: 30000,
    img: 'https://www.kitguru.net/wp-content/uploads/2019/10/featured-1.jpg',
    discription: 'test',
  ),
  Item(
    id: 7,
    title: 'RX 580',
    price: 29000,
    img: 'https://ru.gecid.com/data/video/201902150800-55142/img/09_amd_radeon_rx_590.jpg',
    discription: 'test',
  ),
];

  