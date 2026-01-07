import 'package:flutter/material.dart';
import 'package:universe/features/chat_bot/ui/widgets/bot_typing_indicator.dart';
import 'package:universe/features/chat_bot/ui/widgets/message_bubble.dart';

class ChatMessageList extends StatefulWidget {
  final List<Map<String, dynamic>> messages;

  const ChatMessageList({super.key, required this.messages});

  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void didUpdateWidget(ChatMessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients && widget.messages.isNotEmpty) {
      _scrollController.animateTo(
        0.0, // to top
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.messages.map((msg) {
          if (msg['isTyping'] == true) {
            return const BotTypingIndicator();
          }
          return MessageBubble(text: msg['text'], isBot: msg['isBot']);
        }).toList(),
      ),
    );
  }
}
