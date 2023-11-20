import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final inputBoxColor;

  final inputBoxWidth;

  final inputBoxRadius;

  final labelFontSize;

  final labelSpacing;

  final userController;

  UserForm(
      {super.key,
      this.inputBoxColor,
      this.inputBoxWidth,
      this.inputBoxRadius,
      this.labelFontSize,
      this.labelSpacing,
      this.userController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Usuário",
          style: TextStyle(color: Colors.white, fontSize: labelFontSize),
        ),
        SizedBox(height: labelSpacing),
        Container(
          decoration: BoxDecoration(
            borderRadius: inputBoxRadius,
            color: inputBoxColor,
          ),
          width: inputBoxWidth,
          child: TextFormField(
            controller: userController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.person),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length > 20 ||
                  value.endsWith(' ')) {
                return 'Valor Inválido';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
