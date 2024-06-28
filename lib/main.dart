import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'services/web_socket_service.dart';
import 'bloc/chat_bloc.dart';
import 'models/message.dart';
import 'models/message_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MessageAdapter());
  await Hive.openBox<Message>('messages');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatBloc(WebSocketService()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/chat': (context) => ChatScreen(username: 'Default User'),
        },
      ),
    );
  }
}
