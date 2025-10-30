import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({super.key, required this.onValue});
  final ValueChanged<String> onValue;

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
            onPressed: (){
              final textValue = textController.value.text;
            widget.onValue(textValue); //llamar al metodo padre
              textController.clear();
            }, 
            icon: Icon(Icons.send_outlined)
          ),
        );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
       // keyboardAppearance: Brightness.dark ,
       onTapOutside: (event){
        focusNode.unfocus();
       },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
           widget.onValue(value ); 
          textController.clear();
          focusNode.requestFocus();
        },
  
        
        ),
    );
  }
}