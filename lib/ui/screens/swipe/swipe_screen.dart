import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/app_bar_common.dart';

import '../widgets/swipe/background_curve_widget.dart';
import '../widgets/swipe/cards_stack_widget.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Stack(
        children: const [
          // CardCurveWidget(),
          CardsStackWidget(),
        ],
      ),
    );
  }
}
