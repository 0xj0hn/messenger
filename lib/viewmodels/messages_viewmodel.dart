import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessagesViewModel extends ChangeNotifier {
  int? userId;
  final _supabase = Supabase.instance.client;

  sendMessage(int userId, String message) async {
    await _supabase.from("userchat_messages").insert({
      "message_content": message,
    });
    await _supabase.from("userchats").update({
      "last_message": message,
    }).eq("id", userId);
  }

  setMessagesAsUnread(int id) async {
    await _supabase.from("userchats").update({
      "is_seen": true,
    }).eq("id", id);
  }
}
