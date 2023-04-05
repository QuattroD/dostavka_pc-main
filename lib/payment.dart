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
      backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      appBar: AppBar(
        title: const Center(child: Text('Payment'),),
        backgroundColor: const Color.fromARGB(255, 126, 184, 185),
      ),
    );
  }
}