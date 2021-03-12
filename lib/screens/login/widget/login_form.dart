import 'package:flutter/material.dart';
import 'package:nexus_health/screens/login/widget/input_text_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          InputTextField(
            label: 'Email',
            controller: emailController,
            onChange: (value) {},
          ),
          SizedBox(height: 16,),
          InputTextField(
            label: 'Password',
            controller: passwordController,
            password: true,
            onChange: (value) {},
          ),
        ],
      ),
    );
  }
}