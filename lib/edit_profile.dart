import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  ChangePassword({email, oldPass, newPass}) async {
    var cred = EmailAuthProvider.credential(email: email, password: oldPass);
    await currentUser!.reauthenticateWithCredential(cred).then((value){
      currentUser!.updatePassword(newPass);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 74, 92),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 145, 159),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit profile",
                  style: TextStyle(
                    color: Color.fromARGB(255, 233, 241, 243),
                    fontSize: 30,
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: oldPassword,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Entry old password",
                    label: const Text(
                      "Old password",
                    ),
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    prefixIcon: const Icon(
                      Icons.password_rounded,
                      color: Color.fromARGB(255, 233, 241, 243),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: newPassword,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Entry new password",
                    label: const Text(
                      "New password",
                    ),
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color.fromARGB(255, 233, 241, 243),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),          
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 134, 145, 159)),
                  ),
                  onPressed: () async {
                    await ChangePassword(
                      email: currentUser!.email.toString(),
                      oldPass: oldPassword.text,
                      newPass: newPassword.text
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/lk');
                  },
                  child: const Text("Edit"),
                ),
              ),
            ]
          ),
          ) 
      ),
    );
  }
}