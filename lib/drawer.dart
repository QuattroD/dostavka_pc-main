import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

var userInfo = FirebaseAuth.instance;

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  late String imgDrawer;
  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();  
    imgDrawer = '';  
    getImageUrl();
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child('ProfileImage').child(userInfo.currentUser!.email.toString());
    final url = await ref.getDownloadURL();
    setState(() {
      imgDrawer = url;
    });
}
  
  @override
  Widget build(BuildContext context) {
    return Drawer(  
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 134, 145, 159)
              ),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/lk');
                  },
                  icon: const Icon(Icons.person_pin, color: Color.fromARGB(255, 233, 241, 243),),
                ),
              ],
              currentAccountPicture: Container(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: imgDrawer != '' ? NetworkImage(imgDrawer) : const NetworkImage("https://w7.pngwing.com/pngs/799/987/png-transparent-computer-icons-avatar-social-media-blog-font-awesome-avatar-heroes-computer-wallpaper-social-media.png")
                ),
              ),
              accountName: Text(userInfo.currentUser!.email.toString()),
              accountEmail: const Text('')),
        ),
        ListTile(
          leading: const Icon(
            Icons.info_rounded,
            color: Color.fromARGB(255, 198, 218, 225)
          ),
          title: const Text(
            'About us',
            style: TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Color.fromARGB(255, 233, 241, 243),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.shop,
            color: Color.fromARGB(255, 198, 218, 225),
          ),
          title: const Text(
            'Shop',
            style: TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Color.fromARGB(255, 233, 241, 243),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, '/shop');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.help,
            color: Color.fromARGB(255, 198, 218, 225),
          ),
          title: const Text(
            'Help',
            style: TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Color.fromARGB(255, 233, 241, 243),
          ),
          onTap: () {},
        )
      ],
    ));
  }
}