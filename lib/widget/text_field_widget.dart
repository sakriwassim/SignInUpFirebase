import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.Controler,
  }) : super(key: key);

  final TextEditingController Controler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controler,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(labelText: "Email"),
      onChanged: (String val) {
        //  email = val;
      },
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 18.0),
    );
  }
}
