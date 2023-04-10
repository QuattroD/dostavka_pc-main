import 'package:dostavka_pc/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

var currentUser = FirebaseAuth.instance.currentUser;

class PersonAcc extends StatefulWidget {
  const PersonAcc({super.key});

  @override
  State<PersonAcc> createState() => _PersonAccState();
}

class _PersonAccState extends State<PersonAcc> {
  late String emailDrawer;
  
  @override
  void initState() {
  super.initState();  
  emailDrawer = userInfo.currentUser!.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 134, 145, 159),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    emailDrawer,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit');
                        },
                        heroTag: 'editprofile',
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 255, 165, 92),
                        label: const Text("Edit profile"),
                        icon: const Icon(Icons.edit),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.pushNamed(context, '/history');
                        },
                        heroTag: 'history',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("History"),
                        icon: const Icon(Icons.history_toggle_off),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Promocodes", 4),
    ProfileInfoItem("Notify", 13),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
              ),
            ),
          ),
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.white
            )
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatefulWidget {
  const _TopPortion();

  @override
  State<_TopPortion> createState() => __TopPortionState();
}

class __TopPortionState extends State<_TopPortion> {
File? _file;
bool isDefault = false;
late String img;
final storage = FirebaseStorage.instance;

@override
void initState() {
  super.initState();  
  img = '';
  getImageUrl();
}

Future<void> getImageUrl() async {
  final ref = storage.ref().child('ProfileImage').child(userInfo.currentUser!.email.toString());
  final url = await ref.getDownloadURL();
  setState(() {
    img = url;
  });
}

Future <void> _uploadphotofile(mFileImage) async {
  final  Reference storageReference = FirebaseStorage.instance.ref().child("ProfileImage");
  storageReference.child(userInfo.currentUser!.email.toString()).putFile(_file!);
}

void _getImageFromPhotoLibrary(context) {
  _getFile(ImageSource.gallery, context);
}

Future<void> _getFile(ImageSource source, BuildContext context) async {
  try {
    final file = await ImagePicker().pickImage(source: source);
    setState(() {
      _file = File(file!.path);
      isDefault = true;
      _uploadphotofile(_file);
      getImageUrl();
    });
  } catch (e) {
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color.fromARGB(255, 59, 74, 92),Color.fromARGB(255, 134, 145, 159)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,                    
                        image: img != '' ? NetworkImage(img) : const NetworkImage("https://w7.pngwing.com/pngs/799/987/png-transparent-computer-icons-avatar-social-media-blog-font-awesome-avatar-heroes-computer-wallpaper-social-media.png")),
                  )
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      _getImageFromPhotoLibrary(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}