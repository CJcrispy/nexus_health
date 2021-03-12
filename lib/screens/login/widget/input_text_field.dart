import 'package:flutter/material.dart';
import 'package:nexus_health/config/constant.dart';


class InputTextField extends StatelessWidget {
  InputTextField({
    Key key,
    this.label,
    this.onChange, this.password = false, TextEditingController controller,
  }) : super(key: key);

  final String label;
  final Function onChange;
  final bool password;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      obscureText: password,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: mPrimaryColor,
              width: 2,
            )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: mPrimaryColor,
              width: 2,
            )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.5,
            )),
      ),
    );
  }
}