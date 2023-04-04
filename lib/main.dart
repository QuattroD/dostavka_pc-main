import 'package:dostavka_pc/basket.dart';
import 'package:dostavka_pc/history.dart';
import 'package:dostavka_pc/edit_profile.dart';
import 'package:dostavka_pc/shop.dart';
import 'package:flutter/material.dart';
import 'package:dostavka_pc/home.dart';
import 'auth.dart';
import 'reg.dart';
import 'lk.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyThemeApp());
}

class MyThemeApp extends StatelessWidget {
  const MyThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  const AuthPage(),
        '/home': (context) => const HomePage(),
        '/reg': (context) => const RegPage(),
        '/shop':(context) => const ShopPage(),
        '/lk':(context) => const PersonAcc(),
        '/edit':(context) => const EditProfilePage(),
        '/history':(context) => const HistoryPage(),
        '/basket':(context) => const BasketPage(),
      },
    );
  }
}