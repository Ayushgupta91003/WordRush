import 'package:socket_io_client/socket_io_client.dart' as IO;

// final String Uri = 'http://10.0.5.42:3000';

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    // socket = IO.io('http://10.0.5.42:3000', <String, dynamic>{
    socket = IO.io('https://wordrushserver.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}





// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketClient {
//   IO.Socket? socket;
// }
