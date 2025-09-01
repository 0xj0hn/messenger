import 'package:flutter/material.dart';
import 'package:messenger/config/darkTheme.dart';
import 'package:messenger/viewmodels/bottom_nav_model.dart';
import 'package:messenger/views/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: "https://ximkhygnwmhwehgeulfe.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhpbWtoeWdud21od2VoZ2V1bGZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3ODgzNjQsImV4cCI6MjAxNzM2NDM2NH0.LaB-bqJaLNlLn4k_2c0aoICyjoeC4EVt2FP2xk5cFZ4",
  );
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
