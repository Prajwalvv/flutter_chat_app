import 'package:chatproject/models/message_adapter.dart';
import 'package:hive/hive.dart';
import '../models/message.dart';

class HiveService {
  static const String boxName = 'messagesBox';

  Future<void> init() async {
    Hive.registerAdapter(MessageAdapter());
    await Hive.openBox<Message>(boxName);
  }

  Future<void> addMessage(Message message) async {
    final box = Hive.box<Message>(boxName);
    await box.add(message);
  }

  List<Message> getMessages() {
    final box = Hive.box<Message>(boxName);
    return box.values.toList();
  }
}
