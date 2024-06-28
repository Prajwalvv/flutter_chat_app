import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel channel;

  WebSocketService() {
    connect();
  }

  void connect() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.org'),
    );
  }

  void sendMessage(String message) {
    channel.sink.add(message);
  }

  Stream<dynamic> get messages => channel.stream;

  void disconnect() {
    channel.sink.close();
  }
}
