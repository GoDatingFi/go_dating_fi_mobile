import 'package:flutter/material.dart';

import '../../router/fluro_navigator.dart';
import '../../router/router_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),

      body: Column(
        children: [
          InkWell(
            child: Text("Browser"),
            onTap: (){
              NavigatorUtils.push(
                  context, RouterGenerator.routeBrowser);
            },
          ),
          SizedBox(height: 100),
          InkWell(
            child: Text("advertiser"),
            onTap: (){
              NavigatorUtils.push(
                  context, RouterGenerator.routeAdvertiser);
            },
          )
        ],
      ),
    );
  }
}
