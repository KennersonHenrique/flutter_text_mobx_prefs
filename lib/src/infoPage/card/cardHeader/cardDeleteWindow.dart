import 'package:flutter/material.dart';

class DeleteWindow extends StatelessWidget {
  final textManagement;

  const DeleteWindow({super.key, this.textManagement});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconColor: Colors.white,
      title: const Text('Remoção'),
      content: const Text('Você gostaria de remover o texto salvo?'),
      actions: <Widget>[
        TextButton(
          onPressed: () =>
              {textManagement.remove(), Navigator.pop(context, 'OK')},
          child: const Text('Sim'),
        ),
        TextButton(
          onPressed: () => {Navigator.pop(context, 'Cancel')},
          child: const Text('Não'),
        ),
      ],
    );
  }
}
