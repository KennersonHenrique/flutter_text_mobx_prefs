import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatelessWidget {
  final inputBoxColor;

  final inputBoxWidth;

  final inputBoxRadius;

  final labelFontSize;

  final labelSpacing;

  final passWController;

  const PasswordField(
      {super.key,
      this.inputBoxColor,
      this.inputBoxWidth,
      this.inputBoxRadius,
      this.labelFontSize,
      this.labelSpacing,
      this.passWController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Senha",
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
            controller: passWController,
            //false fort testing purposes
            obscureText: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length < 2 ||
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
