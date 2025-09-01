import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messenger/viewmodels/messages_viewmodel.dart';
import 'package:messenger/views/widgets/message_bubble_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessagesDetailsScreen extends StatefulWidget {
  final int id;
  final String title;

  MessagesDetailsScreen({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<MessagesDetailsScreen> createState() => _MessagesDetailsScreenState();
}

class _MessagesDetailsScreenState extends State<MessagesDetailsScreen> {
  final TextEditingController controller = TextEditingController();

  final supabase = Supabase.instance.client;
  @override
  void initState() {
    super.initState();
    MessagesViewModel().setMessagesAsUnread(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: StreamBuilder(
              stream: supabase
                  .from("userchat_messages")
                  .stream(primaryKey: ["id"])
                  .order('created_at', ascending: false)
                  .limit(8),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    dragStartBehavior: DragStartBehavior.down,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return MessageBubble(
                        isMe: true,
                        message: snapshot.data!.toList()[index]
                            ["message_content"],
                        time: snapshot.data![index]["created_at"],
                      );
                    },
                  );
                }
                return const LinearProgressIndicator();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 59, 55, 100),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write your message...",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.send_rounded,
                          size: 30,
                        ),
                        onPressed: () async {
                          final message = controller.text;
                          controller.clear();
                          MessagesViewModel().sendMessage(widget.id, message);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
