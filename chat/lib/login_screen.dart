
import 'package:chatting/signUp_Screen.dart';
import 'package:chatting/widgets/buildButton.dart';
import 'package:chatting/widgets/buildtextfield.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


import 'chat_page.dart';
import 'constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignUpScreenState extends State<SignInScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign in",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 30,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      size: MediaQuery.of(context).size.width * .15,
                    ),
                  ],
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16),
                ),
                BuildTextField(
                  hint: "Enter your email...",
                  onPressed: () {},
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                  ),
                  controller: emailController,
                  padding: 20,
                  validate: () {},
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 16),
                ),
                BuildTextField(
                  hint: "Enter your password...",
                  onPressed: () {},
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                  controller: passwordController,
                  padding: 20,
                  validate: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading
                        ? CircularProgressIndicator()
                        : BuildButton(
                            text: "Sign In",
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ).then((value) {
                                  Constant.userId = value.user!.uid;
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatPage(),
                                    ),
                                  );
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            width: MediaQuery.of(context).size.width * .7,
                          ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ?"),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    }, child: Text("Sign Up"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
