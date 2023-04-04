import 'package:flutter/material.dart';
import 'item.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
  
}

class _ShopPageState extends State<ShopPage> {
  final list = [
    const ItemPages(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      appBar: AppBar(
        title: const Center(child: Text('Machinalis scientia'),),
        backgroundColor: const Color.fromARGB(255, 126, 184, 185),
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/basket');
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
          basketuser.isEmpty ? Container() :
          Positioned(
            child: Stack(
              children: <Widget>[
                const Icon(
                  Icons.brightness_1,
                  size: 30,
                  color: Colors.amber,
                ),
                Positioned(
                  top: 9,
                  right: 9,
                  child: Center(
                    child: Text(
                      basketuser.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: list.elementAt(0),
    );
  }
}