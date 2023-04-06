import 'item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPagesState();
}

  class _BasketPagesState extends State<BasketPage> {
  TextEditingController searchController = TextEditingController();
  List<String> newBasketUser = List.from(basketuser);
  onItemSearch(String value) {
    setState(
      () {
        newBasketUser = basketuser.where((element) => element.toLowerCase().contains(value)).toList();
      },
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            label: Text('Name')
          ),
          controller: searchController,
          onChanged: onItemSearch,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 184, 185),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();

              });
            },
            icon: const Icon(Icons.close),
          ),
          basketuser.isEmpty ? Container() :
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/payment');
            }, 
            icon: const Icon(Icons.add_card_outlined)
          )
        ],
      ),
      body: newBasketUser.isEmpty ? Center(
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
      itemCount: newBasketUser.length,
      prototypeItem: ListTile(
        title: Text(newBasketUser.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(newBasketUser[index]),
          leading: IconButton(
            onPressed: () {     
              setState(() {
                basketuser[index];
                newBasketUser[index];
              });
              FirebaseFirestore.instance.collection('Basket').doc(newBasketUser[index]).delete();
              newBasketUser.remove(newBasketUser[index]);
                           
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