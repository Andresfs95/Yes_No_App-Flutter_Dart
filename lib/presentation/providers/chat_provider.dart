import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; //PARA NO ENVIAR MENSAJES VACIOS

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }

    notifyListeners(); //¿hay camnbio? se notifica
    moveScrollToBottom(); //Llamamos a la animacion al notificar los cambios
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage); //recoge/agrega mensaje de ella
    notifyListeners(); //¿hay camnbio? se notifica

    moveScrollToBottom(); //Llamamos a la animacion al notificar los cambios
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(
        milliseconds: 100)); //para que el envio vaya a la par que el texto
    //ANIMACION EN PANTALLA
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
