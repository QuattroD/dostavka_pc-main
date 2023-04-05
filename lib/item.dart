import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

List<String> basketuser = <String>[];

class ItemPages extends StatefulWidget {
  const ItemPages({super.key});

  @override
  State<ItemPages> createState() => _ItemPagesState();
}

  class _ItemPagesState extends State<ItemPages> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemList.map(
        (e) {
          return GFCard( 
            elevation: 10,
            boxFit: BoxFit.fill,
            titlePosition: GFPosition.start,
            image: Image.network(
              e.img.toString(),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill
              ),
            content: Text(e.title.toString()),
            showImage: true,
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    setState(() {
                      basketuser.length;
                    });
                    basketuser.add(e.title.toString()); 
                    FirebaseFirestore.instance.collection('Basket').add(
                      {
                        'id': e.id,
                        'discription': e.discription,
                        'title': e.title
                      }
                    );
                  },
                  text: 'Buy',
                  color: const Color.fromARGB(255, 59, 158, 162),
                ),
                GFButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)
                              ),
                          child: Container(
                            color: const Color.fromARGB(255, 59, 158, 162),
                            height: 400,
                            child: Text(e.title.toString()),                         
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
        }
      ).toList(),
    );
  }
} 

class Item {
  int? id;
  String? title;
  String? discription;
  String? img;
  Item({this.id, this.title, this.discription, this.img});
}

List<Item> itemList = [
  Item(
    id: 1,
    title: 'RTX 3060 Palit',
    img: 'https://i.pcmag.com/imagery/roundups/03IN5Ry7Nys41YSqJtZcQSr-1.1607129333.fit_lim.size_1200x630.jpg',
    discription: 'test',
  ),
  Item(
    id: 2,
    title: 'GTX 1660 Palit',
    img: 'https://www.kitguru.net/wp-content/uploads/2019/10/featured-1.jpg',
    discription: 'test',
  ),
  Item(
    id: 3,
    title: 'RX 580',
    img: 'https://ru.gecid.com/data/video/201902150800-55142/img/09_amd_radeon_rx_590.jpg',
    discription: 'test',
  ),
  Item(
    id: 2,
    title: 'GTX 1660 Palit',
    img: 'https://www.kitguru.net/wp-content/uploads/2019/10/featured-1.jpg',
    discription: 'test',
  ),
  Item(
    id: 3,
    title: 'RX 580',
    img: 'https://ru.gecid.com/data/video/201902150800-55142/img/09_amd_radeon_rx_590.jpg',
    discription: 'test',
  ),
  Item(
    id: 2,
    title: 'GTX 1660 Palit',
    img: 'https://www.kitguru.net/wp-content/uploads/2019/10/featured-1.jpg',
    discription: 'test',
  ),
  Item(
    id: 3,
    title: 'RX 580',
    img: 'https://ru.gecid.com/data/video/201902150800-55142/img/09_amd_radeon_rx_590.jpg',
    discription: 'test',
  ),
];

  