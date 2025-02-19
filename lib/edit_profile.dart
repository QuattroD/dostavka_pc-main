import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

TextEditingController displayName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password= TextEditingController();
TextEditingController passwordConfirm= TextEditingController();
var userEdit = FirebaseAuth.instance;

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 126, 184, 185),
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
                  controller: displayName,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Entry name",
                    label: const Text(
                      "Name",  
                    ),
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    prefixIcon: const Icon(
                      Icons.person,
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
                  controller: email,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Entry email",
                    label: const Text(
                      "Email",
                    ),
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    prefixIcon: const Icon(
                      Icons.email,
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
                  controller: password,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Entry password",
                    label: const Text(
                      "Password",
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
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: passwordConfirm,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    label: const Text(
                      "Confirm password",
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
                    backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 126, 184, 185)),
                  ),
                  onPressed: ()  {
                    userEdit.userChanges();
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