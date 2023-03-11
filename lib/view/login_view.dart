import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TextField(
            decoration: InputDecoration(
                hintText: "email", labelText: "", suffixIcon: Icon(Icons.lock)),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "password",
                labelText: "",
                suffixIcon: Icon(Icons.lock)),
          ),
        ],
      ),
    );
  }
}
