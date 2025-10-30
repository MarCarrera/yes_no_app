import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatefulWidget {
  const MyMessageBubble({super.key, required this.message});
  final Message message;

  @override
  State<MyMessageBubble> createState() => _MyMessageBubbleState();
}

class _MyMessageBubbleState extends State<MyMessageBubble> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(widget.message.text,
            style: TextStyle(color: Colors.white),),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}