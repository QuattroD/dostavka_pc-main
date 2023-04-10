import 'package:flutter/material.dart';
import 'item.dart';
import 'drawer.dart';

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
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('{ } DevKit'),
        centerTitle: true,  
        backgroundColor: const Color.fromARGB(255, 134, 145, 159),
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
        ],
      ),
      body: list.elementAt(0),
    );
  }
}