import 'package:flutter/material.dart';
import 'package:nexus_health/auth/authService.dart';
import 'package:nexus_health/config/constant.dart';
import 'package:nexus_health/screens/main/main.dart';
import 'package:nexus_health/screens/login/widget/login_form.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        color: mPrimaryColor,
        onPressed: () {
          context.read<AuthenticationService>().signIn(
            email: LoginForm().emailController.text.trim(),
            password: LoginForm().passwordController.text.trim(),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}