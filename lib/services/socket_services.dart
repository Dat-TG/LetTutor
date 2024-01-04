// ignore_for_file: library_prefixes

import 'dart:collection';
import 'dart:developer'; // Use 'package:web_socket_channel/html.dart' for web applications

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketMessage {
  final String eventName;
  final dynamic data;

  SocketMessage(this.eventName, this.data);
}

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

  Queue<SocketMessage> messageQueue = Queue<SocketMessage>();

  void connectToServer() async {
    socket.connect();

    socket.on('connect', (_) {
      log('Connected to Socket.IO server');
      processMessageQueue();
      log(socket.id!); // x8WIv7-mJelg7on_ALbx
      // Additional actions upon successful connection
    });

    socket.onPing((data) {
      log('data: $data');
      log('type: ${data.runtimeType}');
      socket.emit('pong', data);
    });

    socket.on('disconnect', (_) {
      log('Disconnected from Socket.IO server');
      // Handle disconnection
    });

    socket.on('chat:returnNewMessage', (data) {
      log('Received data: $data');
      // Handle incoming events/data from the server
    });

    socket.onAny((event, data) => {
          log('Received event: $event with data: $data'),
        });
  }

  void sendEvent(String eventName, dynamic data) {
    if (socket.connected) {
      socket.emit(eventName, data);
    } else {
      // Handle not connected state if needed
      log('Socket not connected');
      messageQueue.add(SocketMessage(eventName, data));
      log(messageQueue.length.toString());
    }
  }

  void processMessageQueue() {
    log('Process message queue');
    log(messageQueue.length.toString());
    while (messageQueue.isNotEmpty) {
      final message = messageQueue.removeFirst();
      log('Resend message: ${message.eventName} with data: ${message.data}');
      socket.emit(message.eventName, [message.data]);
    }
  }

  void closeConnection() {
    if (socket.connected) {
      socket.disconnect();
    }
  }
}
