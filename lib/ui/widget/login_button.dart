import 'package:flutter/material.dart';

import '../page/home_screen.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  LoginButton(
      {required this.passwordController, required this.usernameController});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder?>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          elevation: MaterialStateProperty.all(10),
        ),
        onPressed: () {
          final snackbar = SnackBar(
            content: Text("Username/Password it's wrong!"),
          );
          if (widget.usernameController.text != 'mhaekal' ||
              widget.passwordController.text != 'helloworld')
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
            final name = widget.usernameController.text;
            final snackbar2 = SnackBar(
              content: Text("Welcome $name!"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar2);
          }
        },
        child: Text(
          'login',
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
