import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
        ),  
        title: const Text('Monty Boot'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView({
    super.key,
  });

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  @override
  Widget build(BuildContext context) {
    //extiende el buildcontext, aparece solo si existe provider
    final chatProvider = context.watch<ChatProvider>();

    //SafeArea : area segura centra el contenido en la pantalla
    return SafeArea(
      //no limitamos a left y right
      //left: false,
      //right: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.her)
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message,);
                },
              )
            ),
            //Caja de texto
            MessageFieldBox(
              onValue : chatProvider.sendMessage
                
              ,
            ),
          ],
        ),
      ),
    );
  }
}