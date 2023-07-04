import 'package:flutter/material.dart';
import 'package:messenger/viewmodels/bottom_nav_model.dart';
import 'package:messenger/views/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    const Text("Hello this is it"),
    const Text("Hello this is not"),
    const Text("GoodBye"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger"),
      ),
      body: Navigator(
        initialRoute: "messages",
        onGenerateRoute: (settings) {
          late Widget page;
          if (settings.name == "home") {
            page = pages[0];
          } else if (settings.name == "messages") {
            page = pages[1];
          } else if (settings.name == "settings") {
            page = pages[2];
          } else {
            throw Exception("Unknown route!");
          }
          return MaterialPageRoute(
            builder: (context) => page,
            settings: settings,
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
