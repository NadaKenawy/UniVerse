import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/chat_bot/data/services/chat_storage_service.dart';
import 'package:universe/features/chat_bot/logic/chat_bot_cubit.dart';
import 'package:universe/features/chat_bot/logic/chat_bot_state.dart';
import 'package:universe/features/chat_bot/ui/widgets/bot_typing_indicator.dart';
import 'package:universe/features/chat_bot/ui/widgets/chat_message_list.dart';
import 'package:universe/features/chat_bot/ui/widgets/message_input_field.dart';

class ChatBotScreenBody extends StatefulWidget {
  const ChatBotScreenBody({super.key});

  @override
  State<ChatBotScreenBody> createState() => _ChatBotScreenBodyState();
}

class _ChatBotScreenBodyState extends State<ChatBotScreenBody> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedMessages();
  }

  Future<void> _loadSavedMessages() async {
    try {
      final savedMessages = await ChatStorageService.getMessages();
      setState(() {
        messages.clear();
        messages.addAll(savedMessages);
      });
    } catch (e) {
      log('Error loading messages: $e');
    }
  }

  Future<void> _saveMessage(Map<String, dynamic> message) async {
    final allMessages = [...messages, message];
    final uniqueMessages = <String, Map<String, dynamic>>{};
    for (var msg in allMessages) {
      final key = '${msg['text']}_${msg['isBot']}';
      uniqueMessages[key] = msg;
    }
    await ChatStorageService.saveMessages(uniqueMessages.values.toList());
  }

  void _handleSend(String text) {
    if (text.trim().isEmpty) return;

    final userMessage = {'isBot': false, 'text': text};

    if (!messages.any(
      (msg) => msg['text'] == userMessage['text'] && msg['isBot'] == false,
    )) {
      setState(() {
        messages.add(userMessage);
      });

      _saveMessage(userMessage);
    }
    _controller.clear();

    context.read<ChatCubit>().sendMessage(message: text);
  }

  void _clearChat() async {
    await ChatStorageService.clearMessages();
    setState(() {
      messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'University AI Assistant',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.bottomSlide,
              title: 'Clear Chat',
              desc: 'Are you sure you want to clear the chat history?',
              btnCancelOnPress: () {},
              btnOkOnPress: _clearChat,
            ).show,
          ),
        ],
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (response) async {
              final botMessage = {'isBot': true, 'text': response.answer};

              if (!messages.any(
                (msg) =>
                    msg['text'] == botMessage['text'] && msg['isBot'] == true,
              )) {
                setState(() {
                  messages.add(botMessage);
                });

                await _saveMessage(botMessage);
              }
            },
            error: (apiError) {
              final errorMessage = {'isBot': true, 'text': apiError};

              setState(() {
                messages.add(errorMessage);
              });

              // Do not save error messages
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Column(
            children: [
              Expanded(
                child: messages.isEmpty && !isLoading
                    ? Container(
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome to University Assistant! 🎓',
                              style: TextStyles.font24PrimarySemiBold.copyWith(
                                fontSize: 20.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'I\'m here to help you with university questions and provide academic assistance.',
                              style: TextStyles.font14BlackMedium.copyWith(
                                color: ColorsManager.darkGrey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsManager.primary.withValues(
                                  alpha: .05,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.school,
                                    size: 16.sp,
                                    color: ColorsManager.primary,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Start chatting to get academic help',
                                    style: TextStyles.font14PrimaryMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ChatMessageList(messages: messages),
              ),
              if (isLoading) const BotTypingIndicator(),
              MessageInputField(
                controller: _controller,
                onSend: isLoading ? (_) {} : _handleSend,
              ),
            ],
          );
        },
      ),
    );
  }
}
