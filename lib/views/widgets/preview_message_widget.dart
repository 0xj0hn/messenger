import 'package:flutter/material.dart';

class PreviewMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSeen;
  final Function()? onPressed;
  const PreviewMessage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSeen,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      leading: const CircleAvatar(),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: !isSeen ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ),
      onTap: onPressed,
    );
  }
}
