import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/core/widgets/app_text_feild.dart';
import 'package:may_fair/features/screens/chat_screen/cubit/chat_cubit.dart';
import 'package:may_fair/features/screens/chat_screen/cubit/chat_state.dart';
import 'package:may_fair/generated/l10n.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ChatCubit chatCubit = ChatCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.current.driver,
              style: TextStyles.font14MediumWhite,
            ),
            backgroundColor: Colors.teal,
          ),
          body: ChatBody(),
          bottomNavigationBar: ChatInputField(
              controller: chatCubit.messageController,
              sendMessage: () {
                if (!chatCubit.messageController.text.isNullOrEmpty()) {
                  chatCubit.sendMessage(
                      recieveId: 'zXqxGnr1n8Ooec9Vk75tOkNjtUy2');
                } else {
                  print("empty message");
                }
              }),
        );
      },
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      children: const [
        ChatBubble(
          text: "Hello!",
          isSender: false,
          time: "10:00 AM",
        ),
        ChatBubble(
          text: "Hi, how are you?",
          isSender: true,
          time: "10:02 AM",
        ),
        ChatBubble(
          text: "I'm good, thanks! What about you?",
          isSender: false,
          time: "10:03 AM",
        ),
        ChatBubble(
          text: "Doing well, thank you!",
          isSender: true,
          time: "10:05 AM",
        ),
        // Add more ChatBubble widgets here for more messages
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSender ? Colors.teal : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            verticalSpace(20),
            Text(
              time,
              style: TextStyle(
                color: isSender ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
            // Spacer(),
            // ChatInputField(),
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField(
      {super.key, required this.sendMessage, required this.controller});
  final VoidCallback sendMessage;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: AppTextFormFeild(
                  controller: controller,
                  hintText: S.current.type_your_message,
                  validator: (value) {})),
          horizontalSpace(15),
          IconButton(
              onPressed: () {
                sendMessage();
              },
              icon: const Icon(Icons.send, color: Colors.teal)),
        ],
      ),
    );
  }
}
