import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String time;
  const MessageBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
        left: isMe ? size.width * 0.3 : 0,
        bottom: 10,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: isMe ? Radius.circular(5) : Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
      child: Text(message),
    );
  }
}
