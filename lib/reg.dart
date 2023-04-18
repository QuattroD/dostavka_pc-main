import 'package:flutter/material.dart';
import 'package:dostavka_pc/model.dart';
import 'package:dostavka_pc/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController  login = TextEditingController();
TextEditingController  password = TextEditingController();
TextEditingController  name = TextEditingController();
var userinfo = FirebaseAuth.instance;
DbConnection dbconnection = DbConnection();

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool hidePass = true;

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
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to { } DevKit",
                    style: GoogleFonts.rowdies(
                      textStyle: const TextStyle(
                      color: Color.fromARGB(255, 233, 241, 243),
                      fontSize: 30,
                      )
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
                  controller: login,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Entry E-mail",
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
                  obscureText: hidePass,
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
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  obscureText: hidePass,
                  decoration: InputDecoration(  
                    suffixIcon: IconButton(
                      color: const Color.fromARGB(255, 233, 241, 243),
                      icon: hidePass == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          if(hidePass == true)
                          {
                            hidePass = false;
                          }
                          else
                          {
                            hidePass = true;
                          }
                        });
                      },
                    ),                 
                    hintText: "Confrim password",
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
                    backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 134, 145, 159)),
                  ),
                  onPressed: () async {
                    UserModel? user = await dbconnection.signUp(login.text, password.text);
                      if (user != null)
                      {} 
                      else {
                        return;
                      }                  
                      Navigator.pushNamed(context, '/home');
                  },
                  child: const Text("Sign up"),
                ),
              ),
            ]
          ),
          ) 
      ),
    );
  }
}