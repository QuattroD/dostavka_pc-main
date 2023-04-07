import 'item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPagesState();
}

  class _BasketPagesState extends State<BasketPage> {
  TextEditingController searchController = TextEditingController();
  List<String> newBasketUser = List.from(basketuser);
  var user = FirebaseAuth.instance;
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
            label: Text('Search')
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
                onItemSearch('');
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
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Container(
          height: 70,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 10,
              )
            ]
          ),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: Text(
                  newBasketUser[index],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: IconButton(
                onPressed: () {     
                  setState(() {
                    basketuser[index];
                    newBasketUser[index];
                  });
                  FirebaseFirestore.instance.collection(user.currentUser!.email.toString()).doc(newBasketUser[index]).delete();
                  newBasketUser.remove(newBasketUser[index]);                          
                }, 
                icon: const Icon(Icons.delete_forever,
                size: 35,)
                ),
              ),
              ],
            ),      
          );
        },
      ),
    );
  }  
}