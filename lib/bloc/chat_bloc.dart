import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../models/message.dart';
import '../services/web_socket_service.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketService webSocketService;
  final Box<Message> messageBox = Hive.box<Message>('messages');

  ChatBloc(this.webSocketService) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<ReceiveMessageEvent>(_onReceiveMessage);

    webSocketService.messages.listen((message) {
      add(ReceiveMessageEvent(
          Message(content: message, timestamp: DateTime.now())));
    });

    emit(ChatLoaded(messageBox.values.toList()));
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) {
    webSocketService.sendMessage(event.message.content);
    messageBox.add(event.message);
    emit(ChatLoaded(messageBox.values.toList()));
  }

  void _onReceiveMessage(ReceiveMessageEvent event, Emitter<ChatState> emit) {
    messageBox.add(event.message);
    emit(ChatLoaded(messageBox.values.toList()));
  }
}
