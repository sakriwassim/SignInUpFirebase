import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigin_sigup_firebase/auth.dart';

import 'homeadmin.dart';
import 'homeuser.dart';
import 'widget/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String dropdownvalue = 'user';

  var items = [
    'user',
    'admin',
  ];

  String? errorMessage = "";
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  void dispose() {
    emailControler.dispose();
    passwordControler.dispose();
    super.dispose();
  }

  Future addUserDetails(String role) async {
    try {
      await FirebaseFirestore.instance.collection("users").add({
        "role": "$role",
      });

      if (role == "admin") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePageAdmin()));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePageUser()));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future register() async {
    try {
      Auth().createUserWithEmailAndPassword(
          email: emailControler.text.trim(),
          password: passwordControler.text.trim());

      addUserDetails(dropdownvalue);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RegisterScreen")),
      body: Column(
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
            child: TextFieldWidget(Controler: passwordControler),
          ),
          SizedBox(
            height: 40,
          ),
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: register, child: Text("Singup")),
        ],
      ),
    );
  }
}
