import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Jacke', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async{
     final newMessage = Message(text: text, fromWho:  FromWho.me);
     messageList.add(newMessage);

     //detectar el signo de interrogacion para devolver respuesta
     if(text.endsWith('?')){
      herReply();
     }

     notifyListeners(); //misma funcion que setState para reconstruir interfaz
     moveScrollToBottom();
  }

  Future<void> moveScrollToBottom()async{
    await Future.delayed(const Duration(milliseconds: 100)); //espera 100 milisegundos para "enviar" el mensaje, da la impresion de que se procesa y envia
    chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent, 
    duration: Duration(milliseconds: 300), 
    curve: Curves.easeOut
    );
  }


  Future<void> herReply()async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

}