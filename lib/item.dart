import 'package:flutter/material.dart';

class ItemPages extends StatelessWidget {
  const ItemPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemList.map(
        (e) {
          return Card(
            elevation: 5,
            child: Column(children: <Widget>[
              const Image(
                image: NetworkImage('https://c.dns-shop.ru/thumb/st4/fit/320/250/d0fa95292f795b6894bea3c8d740949d/7c80865de448b9054d6bd5b08dc25df8674ff369065f8a8ce2fc392625bd0ea6.jpg'),
                colorBlendMode: BlendMode.darken,
                width: double.maxFinite,
                height: 110,
                fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("hello"), Text("hello")]),
                      SizedBox(height: 10),
                      Row(
                        
                      ),
                    ],
                  )
                )
            ]),
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
    img: 'https://c.dns-shop.ru/thumb/st4/fit/320/250/d0fa95292f795b6894bea3c8d740949d/7c80865de448b9054d6bd5b08dc25df8674ff369065f8a8ce2fc392625bd0ea6.jpg',
    discription: 'test',
  ),
];