import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 134, 145, 159),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/yandex');
          }, 
          icon: const Icon(Icons.map)
          )
        ],
      ),
    );
  }
}