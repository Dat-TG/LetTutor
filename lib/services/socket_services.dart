// ignore_for_file: library_prefixes

import 'dart:developer'; // Use 'package:web_socket_channel/html.dart' for web applications

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServices {
  final IO.Socket socket = IO.io(
    'wss://sandbox.api.lettutor.com',
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .setPath('/socket.io/')
        .setQuery({
          'EIO': 4,
          'transport': 'websocket',
        })
        .build(),
  );

  void connectToServer() async {
    socket.on('connect', (_) {
      log('Connected to Socket.IO server');
      // Additional actions upon successful connection
    });

    socket.on('disconnect', (_) {
      log('Disconnected from Socket.IO server');
      // Handle disconnection
    });

    socket.on('event', (data) {
      log('Received data: $data');
      // Handle incoming events/data from the server
    });

    socket.on('chat:returnNewMessage', (data) {
      log('Received data: $data');
      // Handle incoming events/data from the server
    });
  }

  void sendEvent(String eventName, dynamic data) {
    if (socket.connected) {
      socket.emit(eventName, data);
    } else {
      log('Socket not connected');
      // Handle not connected state if needed
    }
  }

  void closeConnection() {
    if (socket.connected) {
      socket.disconnect();
    }
  }
}
