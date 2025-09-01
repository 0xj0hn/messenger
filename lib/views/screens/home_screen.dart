import 'package:flutter/material.dart';
import 'package:messenger/helpers/utils.dart';
import 'package:messenger/viewmodels/bottom_nav_model.dart';
import 'package:messenger/views/screens/messages/messages_screen.dart';
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
    MessagesScreen(),
    const Text("GoodBye"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.watch<BottomNavModel>().currentIndex],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
