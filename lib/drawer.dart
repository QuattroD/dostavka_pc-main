import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(  
      backgroundColor: const Color.fromARGB(255, 59, 158, 162),
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 126, 184, 185)
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
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://w7.pngwing.com/pngs/799/987/png-transparent-computer-icons-avatar-social-media-blog-font-awesome-avatar-heroes-computer-wallpaper-social-media.png"),
                ),
              ),
              accountName: const Text('test'),
              accountEmail: const Text('test')),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Color.fromARGB(255, 198, 218, 225)
          ),
          title: const Text(
            'Home',
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
            Icons.settings,
            color: Color.fromARGB(255, 198, 218, 225)
          ),
          title: const Text(
            'Settings',
            style: TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Color.fromARGB(255, 233, 241, 243),
          ),
          onTap: () {
            
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
