import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                  ),
                  Text("Sign In to your account",style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          )),
          Expanded(flex: 2,child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email Address",style: TextStyle(fontSize: 12),),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                    ),

                  ),
                ),
                Text(""),
                const Text("Password",style: TextStyle(fontSize: 12),),
                const SizedBox(height: 10,),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility_off),
                    contentPadding: const EdgeInsets.all(15),
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Forgot password? ",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.deepOrange),),
                    )
                  ],
                ),
              ],
            ),
          ),),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (){
                print("Login");
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff283FB1),
                  borderRadius: BorderRadius.circular(30)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  ],
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",style: TextStyle(),
              ),
              SizedBox(width: 10,),
              Text(
                "Sign Up ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
              ),
            ],
          ),

          Expanded(child: Container())
        ],
      ),
    );
  }
}
