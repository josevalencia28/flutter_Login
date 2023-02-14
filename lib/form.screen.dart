// import 'dart:html';

// ignore_for_file: avoid_print, non_constant_identifier_names, unused_label

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  // const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final CheckboxController = TextEditingController();
  bool passToggle = true;
  bool? isChecked = false;
// bool checkToggle = true;

  //static String get input => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bienvenido",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/image/imgen.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Ingrese su Email";
                      } else if (!emailValid) {
                        return "Email Invalido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingrese su contraseña";
                      } else if (passController.text.length < 8) {
                        return "La contraseña debe tener minimo 8 caracteres";
                      }
                      {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            if (isChecked == false) {
                              setState(() {
                                isChecked = true;
                              });
                            } else if (isChecked == true) {
                              setState(() {
                                isChecked = false;
                              });
                            }
                            // setState(() {
                            //   isChecked = value;
                            // });
                          }),
                      const Text("Acepto"),
                      const InkWell(
                        // onTap: () {},
                        child: Text(
                          "Terminos y Condiciones",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      if (_formfield.currentState!.validate()) {
                        print("success");
                        emailController.clear();
                        passController.clear();
                        CheckboxController.clear();
                      }
                    },
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: const Center(
                          child: Text(
                            "Ingresar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Ya tienes una cuenta?",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        // ignore: prefer_const_constructors
                        child: Text(
                          " Registrarse",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
