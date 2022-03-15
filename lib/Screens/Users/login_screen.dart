import 'dart:async';
import 'dart:developer';

import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/helpers/validators.dart';
import 'package:flutter_ecommerce/model/user_login.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwrodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                "Criar conta",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) {
                  if (!isEmail(email!)) {
                    return "E-mail Invalido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwrodController,
                decoration: const InputDecoration(hintText: "Senha"),
                autocorrect: false,
                obscureText: true,
                validator: (password) {
                  if (password!.isEmpty || password.length < 6) {
                    return "Senha Inválida";
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Text("Esqueci minha senha"),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() == true) {
                      LoadCustom().openLoadMsg("Logando....");
                      var res = await context.read<UserService>().loginUser(
                          UserLogin(
                              emailController.text, passwrodController.text),
                          context);
                      if (res != null) {
                        passwrodController.text ="";
                      }
                    }
                  },
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Color(0xFF000080),
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
