import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/chat_bot/logic/chat_bot_cubit.dart';
import 'package:universe/features/chat_bot/ui/widgets/chat_bot_screen_body.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatCubit>(
      create: (context) => getIt<ChatCubit>(),
      child: Builder(
        builder: (context) => const Scaffold(body: ChatBotScreenBody()),
      ),
    );
  }
}
