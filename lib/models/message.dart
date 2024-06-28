import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Message {
  @HiveField(0)
  final String content;

  @HiveField(1)
  final DateTime timestamp;

  Message({required this.content, required this.timestamp});
}
