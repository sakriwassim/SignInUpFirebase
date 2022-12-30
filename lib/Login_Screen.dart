import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late String email =;
  // late String password ;

  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  void dispose() {
    emailControler.dispose();
    passwordControler.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text.trim(),
          password: passwordControler.text.trim());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFieldWidget(Controler: emailControler),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: passwordControler,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(labelText: "password"),
            onChanged: (String val) {
              //    password = val;
            },
            textInputAction: TextInputAction.done,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(onPressed: signIn, child: Text("Login")),
      ],
    );
  }
}
