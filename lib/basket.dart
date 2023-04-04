import 'package:dostavka_pc/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
      itemCount: basketuser.length,
      prototypeItem: ListTile(
        title: Text(basketuser.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(basketuser[index]),
        );
      },
    )
    );
  }
}