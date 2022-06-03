import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodels/language_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Consumer<LanguageProvider>(
          builder: (context, languageCollection, _) {
        if (languageCollection.baseLanguageContentModel == null ||
            languageCollection.baseLanguageContentModel!.value == null) {
          languageCollection.getLanguageCollection(context);
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      });
    }));
  }
}
