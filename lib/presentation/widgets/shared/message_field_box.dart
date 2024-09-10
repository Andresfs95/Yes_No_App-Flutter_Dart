import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode =
        FocusNode(); //Para seguir manteniendo en el chat de escribir

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder:
          outlineInputBorder, //COLOCA UN MENSAJE ANTES DE EMPEZAR A ESCRIBIR COMO INDICACION
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined), //ICONO DE ENVIAR
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      //al hacer click fuera de este input se dispara el unfocus y remueve el foco
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration, //PARA ESCRIBIR TEXTO!
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode
            .requestFocus(); //para seguir escribiedno en el teclado sin que se cierre
        onValue(value);
      },
    );
  }
}
