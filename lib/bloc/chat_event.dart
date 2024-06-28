import 'package:equatable/equatable.dart';
import '../models/message.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final Message message;

  const SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

class ReceiveMessageEvent extends ChatEvent {
  final Message message;

  const ReceiveMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}
