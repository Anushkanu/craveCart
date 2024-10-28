import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome", style: TextStyle(color: Colors.blueAccent),),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () {}, child: const Text("LOGIN")),
            const SizedBox(height: 12,),
            TextButton(onPressed: (){
              Navigator.pushReplacementNamed(context, "/register");
            }, child: const Text("New User? Register Here"))
          ],
        )),
    );
  }
}