import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/viewmodels/dating_provider.dart';
import 'package:go_dating_fi_mobile/ui/screens/chat/chat_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/discover/discover_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/profile/profile_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/assets_utils.dart';
import 'package:provider/provider.dart';

import '../widgets/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  late List<Widget> listScreen = <Widget>[];

  @override
  Widget build(BuildContext context) {
    listScreen.clear();
    listScreen = [
      _bodyHome(),
      const DiscoverScreen(),
      const ChatScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
      extendBody: true,
      body: Container(
        color: Colors.white,
        child: listScreen[_selectedTab.index],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(7),
        topLeft: Radius.circular(7),
      ),
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colours.SHADOWN,
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, -4), // changes position of shadow
              ),
            ],
          ),
          child: DotNavigationBar(
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.transparent,
            itemPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            marginR: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            paddingR:
                const EdgeInsets.only(bottom: 0, top: 10, left: 10, right: 10),
            borderRadius: 30,
            backgroundColor: Colors.white,
            onTap: _handleIndexChanged,
            items: [
              DotNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsUtils.HOME_ICON)),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),
              DotNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsUtils.DISCOVER_ICON)),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),
              DotNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsUtils.CHAT_ICON)),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),
              DotNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsUtils.PROFILE_ICON)),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),
            ],
          )),
    );
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  Widget _bodyHome() {
    return Builder(builder: (context) {
      return Consumer<DatingProvider>(builder: (context, dating, _) {
        return Container(
          color: Colors.red,
        );
      });
    });
  }
}

enum _SelectedTab { home, discover, chat, profile }
