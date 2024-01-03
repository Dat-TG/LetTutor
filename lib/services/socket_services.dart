import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart'; // Use 'package:web_socket_channel/html.dart' for web applications

class SocketServices {
  late WebSocketChannel channel;

  void connectToServer() {
    channel = IOWebSocketChannel.connect(
        'wss://sandbox.api.lettutor.com/socket.io/?EIO=4&transport=websocket');
    channel.stream.listen(
      (data) {
        print('Socket Received: $data');
        // Handle received data here
      },
      onDone: () {
        print('Socket closed');
        // Handle socket closed
      },
      onError: (error) {
        print('Error: $error');
        // Handle socket error
      },
    );
  }

  void sendMessage(String message) {
    channel.sink.add(message);
  }

  void closeConnection() {
    channel.sink.close();
  }
}
