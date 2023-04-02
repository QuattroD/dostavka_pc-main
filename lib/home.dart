import 'package:dostavka_pc/drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      appBar: AppBar(
        title: const Center(child: Text('Главная страница'),),
        backgroundColor: const Color.fromARGB(255, 126, 184, 185),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
    );
  }
}