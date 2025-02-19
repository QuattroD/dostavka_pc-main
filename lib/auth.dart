import 'package:flutter/material.dart';
import 'package:dostavka_pc/model.dart';
import 'package:dostavka_pc/service.dart';

TextEditingController  login = TextEditingController();
TextEditingController  password= TextEditingController();

DbConnection dbconnection = DbConnection();
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool sign = false;  
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 158, 162),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Machinalis scientia",
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
                  controller: login,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Введите login",
                    label: const Text(
                      "Login",
                    ),
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 233, 241, 243))),
                    prefixIcon: const Icon(
                      Icons.login,
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
                  style: const TextStyle(color: Color.fromARGB(255, 233, 241, 243)),
                  obscureText: true,
                  cursorColor: const Color.fromARGB(255, 233, 241, 243),
                  decoration: InputDecoration(
                    hintText: "Введите пароль",
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
                  onPressed: () async {
                    UserModel? user = await dbconnection.signIn(
                      login.text, password.text);
                    if (user != null) {
                      
                    }
                    else {
                      // ignore: use_build_context_synchronously
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 59, 158, 162),
                          title: const Text('Error', style: TextStyle(color: Color.fromARGB(255, 233, 241, 243))),
                          content: const Text('Invalid E-mail or Password', style: TextStyle(color: Color.fromARGB(255, 233, 241, 243))),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }, 
                      );
                      return;
                    }
                    Navigator.pushNamed(context, '/home');
                  },
                  child: sign == false 
                    ? const Text("Sign In")
                    : const Text("Sign Up"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                
                child: const Text(
                  "Sign Up?",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/reg');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}