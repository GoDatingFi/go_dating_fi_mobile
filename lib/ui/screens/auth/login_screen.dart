
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';

import '../../../core/viewmodels/language_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Client? httpClient;

  late Web3Client? ethClient;

//Ethereum address
  final String myAddress = "0xbb0978f8970B5367EEE9dCe0C4200Fec1C90cdEe";

//url from Infura
  final String blockchainUrl =
      "https://polygon-mumbai.g.alchemy.com/v2/SLD3j8ZWcKISkyYUmdWAOwruvTT5ovRI";

//strore the value of alpha and beta
  var totalVotesA;
  var totalVotesB;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(blockchainUrl, httpClient!);
    getTotalVotes();
    super.initState();
  }

  Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/abi/contract.json");
    String contractAddress = "0x790EA10a1991Bd4DfA2f698Aa78c58Fc453540A9";
    final contract = DeployedContract(ContractAbi.fromJson(abiFile, "Voting"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> callFunction(String name) async {
    final contract = await getContract();
    final function = contract.function(name);
    final result = await ethClient!.call(contract: contract, function: function, params: []);
    return result;
  }

  Future<void> getTotalVotes() async {
    List<dynamic> resultsA = await callFunction("name");
    Logger().d(resultsA);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Consumer<LanguageProvider>(
          builder: (context, languageCollection, _) {
        if (languageCollection.baseLanguageContentModel == null ||
            languageCollection.baseLanguageContentModel!.value == null) {
          languageCollection.getLanguageCollection(context);
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        }
        return Container();
      });
    }));
  }
}
