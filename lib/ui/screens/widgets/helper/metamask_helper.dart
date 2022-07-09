import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wallet_sdk_metamask/wallet_sdk_metamask.dart';

class MetamaskHelper {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  loginUsingMetamask(
      BuildContext context, String strUri, {Function(Object?)? callback}) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          strUri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        Logger().d(session.accounts[0]);
        Logger().d(session.chainId);
        callback!(session);
      } catch (exp) {
        Logger().e(exp);
      }
    }
  }

  switchChain(String strUri) async {
    if (connector.connected) {
      try {
        Logger().d("add chain");

        EthereumWalletConnectProvider provider =
            EthereumWalletConnectProvider(connector);
        launchUrlString(strUri, mode: LaunchMode.externalApplication);
        var name = "Mumbai";
        var chainId = ChainId.MATIC;
        List<String> rpc = [
          "https://matic-mumbai.chainstacklabs.com",
          "https://rpc-mumbai.maticvigil.com",
          "https://matic-testnet-archive-rpc.bwarelabs.com"
        ];
        var native = {"name": "MATIC", "symbol": "MATIC", "decimals": 18};
        var explorers = ["https://mumbai.polygonscan.com"];

        var response = await provider.addChain(
            chainId: chainId,
            chainName: name,
            nativeCurrency: native,
            rpc: rpc,
            explorers: explorers);
        Logger().i(response);
      } catch (exp) {
        Logger().e(exp);
      }
    }
  }

  listenEvent(
      {Function(Object?)? callback,
      Function(Object?)? payloadCallBack,
      Function(Object?)? disconnectCallBack}) {
    connector.on('connect', (session) => callback!(session));
    connector.on('session_update', (payload) => payloadCallBack!(payload));
    connector.on('disconnect', (payload) => disconnectCallBack!(payload));
  }

  getNetworkName(chainId) {
    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }
}
