import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    _generateWallet();

    super.initState();
  }

  void _generateWallet() async {
    var rng = Random.secure();
    EthPrivateKey priKey = EthPrivateKey.createRandom(rng);
    String s = bytesToHex(priKey.privateKey);
    Logger().d(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: Container(),
    );
  }
}
