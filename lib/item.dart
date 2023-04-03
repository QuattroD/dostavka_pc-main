import 'package:flutter/material.dart';

class ItemPages extends StatelessWidget {
  const ItemPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemList.map(
        (e) {
          return SizedBox(
            height: 250,
            width: 19,
            child: Card(
              shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
              elevation: 5,
              child: Column(
                children: <Widget>[
                   Image(
                    image: NetworkImage(e.img.toString()),
                    width: double.maxFinite,
                    height: 140,
                    fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(e.title!),
                            ],
                          ),
                          IconButton(
                            onPressed: () {

                            }, 
                            icon: const Icon(Icons.add_shopping_cart)
                            )
                        ],
                      ),
                    )
                ],
              ),
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
];