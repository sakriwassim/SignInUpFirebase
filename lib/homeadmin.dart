import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'auth.dart';

class HomePageAdmin extends StatelessWidget {
  HomePageAdmin({super.key});

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Admin Role ${user!.email}"),
      ),
    );
  }
}
