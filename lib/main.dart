import 'package:flutter/material.dart';
import 'package:messenger/config/darkTheme.dart';
import 'package:messenger/viewmodels/bottom_nav_model.dart';
import 'package:messenger/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: DarkTheme.darkTheme,
    );
  }
}
