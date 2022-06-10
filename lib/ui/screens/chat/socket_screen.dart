import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketScreen extends StatefulWidget {
  const SocketScreen({Key? key}) : super(key: key);

  @override
  State<SocketScreen> createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  late IO.Socket _socket;

  @override
  void initState() {
    _socket = IO.io(Constants.CHATING_SERVER);
    _socket.onConnect((_) {
      Logger().d("Longkaka ");
      _socket.emit('msg', 'test');
    });
    _socket.on('event', (data) => Logger().d(data));
    _socket.onDisconnect((_) => Logger().d("disconnect"));
    _socket.on('msgToClient', (_) => Logger().d("Longkaka"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOngkaka"),
      ),
      body: Container(),
    );
  }
}
