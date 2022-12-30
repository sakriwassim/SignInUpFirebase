// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sigin_sigup_firebase/auth.dart';

// import 'homeadmin.dart';
// import 'homeuser.dart';

// class RolePage extends StatelessWidget {
//   const RolePage({super.key});



//   @override
//   Widget build(BuildContext context) {
//     final User? user = Auth().currentUser;

//     Future<void> signOut() async {
//       await Auth().signOut();
//     }

//     Future addUserDetails(String role) async {
//       try {
//         await FirebaseFirestore.instance.collection("users").add({
//           "role": "$role",
//         });

//         if (role == "admin") {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => HomePageAdmin()));
//         } else {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => HomePageUser()));
//         }
//       } on FirebaseAuthException catch (e) {
//         print(e);
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text("home page")),
//       body: Center(
//         child: Column(children: [
//           Text("${user!.email}"),
//           ElevatedButton(onPressed: signOut, child: Text("logout")),
//         ]),
//       ),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {


// FirebaseApp secondary = FirebaseApp.getInstance("role");

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
