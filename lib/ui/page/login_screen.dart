import 'package:flutter/material.dart';
import 'package:shoes_app/ui/widget/login_button.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext contextLoginPage) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Wrap(
          runSpacing: 50,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Text(
              'life on 4.0',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Put username...',
                      contentPadding: EdgeInsets.only(
                          left: 16, bottom: 10, top: 10, right: 16),
                      border: InputBorder.none),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
                child: TextField(
                  obscuringCharacter: '*',
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Put password...',
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 16, bottom: 10, top: 10, right: 16),
                      border: InputBorder.none),
                )),
            Container(
              width: double.infinity,
              child: LoginButton(
                  passwordController: passwordController,
                  usernameController: usernameController),
            )
          ],
        ),
      ),
    ));
  }
}
