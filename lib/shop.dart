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
      ),
      body: list.elementAt(0),
    );
  }
}