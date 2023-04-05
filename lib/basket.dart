import 'package:dostavka_pc/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      appBar: AppBar(
        title: const Center(child: Text('Basket'),),
        backgroundColor: const Color.fromARGB(255, 126, 184, 185),
        actions: [
          basketuser.isEmpty ? Container() :
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/payment');
            }, 
            icon: const Icon(Icons.add_card_outlined)
          )
        ],
      ),
      body: basketuser.isEmpty ? Center(
        child: InkWell(
          child: const Text(
            'Buy something? ಠ_ಠ',
            style: TextStyle(color: Colors.white,
            fontSize: 25),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/shop');
          },
        )
      ) : ListView.builder(
      itemCount: basketuser.length,
      prototypeItem: ListTile(
        title: Text(basketuser.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(basketuser[index]),
          leading: IconButton(
            onPressed: () {
              basketuser.remove(basketuser[index]);
            }, 
            icon: const Icon(Icons.delete_forever)
          ),
          textColor: Colors.white,
          tileColor: const Color.fromARGB(255, 167, 205, 206),        
        );
      },
    ),
    );
  }
}