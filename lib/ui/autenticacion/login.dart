import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController passw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Firebase'),
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.message_sharp,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                decoration:
                    const InputDecoration(labelText: 'Ingrese el Email'),
              ),
              TextField(
                controller: passw,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Constraseña'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Registrarse'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
