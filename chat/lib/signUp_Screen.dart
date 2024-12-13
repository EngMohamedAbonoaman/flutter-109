
import 'package:chatting/widgets/buildButton.dart';
import 'package:chatting/widgets/buildtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'constant.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Sign Up",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.app_registration,
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
                          text: "Sign Up",
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ).then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                                Constant.userId = value.user!.uid;
                                print(Constant.userId);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
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
                  Text("Already have account"),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>SignInScreen()));
                  }, child: Text("Sign In"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
