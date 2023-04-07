import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

var currentUser = FirebaseAuth.instance.currentUser;

class PersonAcc extends StatelessWidget {
  const PersonAcc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 210, 211),
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
                    currentUser!.email.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
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
                        icon: const Icon(Icons.shopping_basket),
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
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.bodySmall,
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
  const _TopPortion({super.key});

  @override
  State<_TopPortion> createState() => __TopPortionState();
}

class __TopPortionState extends State<_TopPortion> {
File? _file;

void _getImageFromPhotoLibrary(context) {
  _getFile(ImageSource.gallery, context);
}

Future<void> _getFile(ImageSource source, BuildContext context) async {
  try {
    print(source);
    final file = await ImagePicker().pickImage(source: source);
    setState(() {
      _file = File(file!.path);
    });
  } catch (e) {
    print(e);
  }
}

String get buttonText => "Записать видео";

IconData get buttonIcon => Icons.photo_camera;
  
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
                  colors: [Color.fromARGB(255, 59, 158, 162), Color.fromARGB(255, 144, 210, 211)]),
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
                        image: FileImage(_file!)),
                  )
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo_camera,
                      color: Color.fromARGB(255, 0, 0, 0),
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
