import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/viewmodels/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Consumer<AuthProvider>(builder: (context, auth, _) {
        return Container();
      });
    }));
  }
}
