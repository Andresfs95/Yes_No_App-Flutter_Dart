import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

//SECCION 5 DEL CURSO UDEMY

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ChatProvider()) //Creamos el chat provaider a nivel global de App
      ],
      child: MaterialApp(
          title: 'YES NO APP',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectorColor: 1).theme(),
          home: const ChatScreen()),
    );
  }
}
