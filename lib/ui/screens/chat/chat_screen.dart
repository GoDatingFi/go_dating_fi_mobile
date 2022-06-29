import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/utils/auth_utils.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../widgets/utils/constants.dart';
import 'chat_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  late IO.Socket _socket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        titleSpacing: -40,
        title: Text(
          Languages.of(context)!.matches,
          style: TextStyles.textSize34S,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: const ChatPage(),
            ),
          )
        ],
      ),
    );
  }
}
