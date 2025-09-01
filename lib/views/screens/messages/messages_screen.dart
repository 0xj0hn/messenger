import 'package:flutter/material.dart';
import 'package:messenger/views/screens/messages/messages_details_screen.dart';
import 'package:messenger/views/widgets/preview_message_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          StreamBuilder(
              stream: supabase.from("userchats").stream(primaryKey: ["id"]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: PreviewMessage(
                              isSeen: snapshot.data![index]["is_seen"],
                              title: snapshot.data![index]["name"],
                              subtitle: snapshot.data![index]["last_message"],
                              onPressed: () {
                                final id = snapshot.data![index]["id"];
                                final title = snapshot.data![index]["name"];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MessagesDetailsScreen(
                                      id: id,
                                      title: title,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 0.2,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const LinearProgressIndicator();
                }
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat_bubble_outline_rounded),
      ),
    );
  }
}
