import 'package:flutter/material.dart';

import '../widgets/chat/all_chat.dart';
import '../widgets/chat/list_matching_horizon.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ListMatchingHorizon(),
          AllChats(),
        ],
      ),
    );
  }
}
