import 'package:flutter/material.dart';

class CardInputWidget extends StatefulWidget {
  final Color buttonTextColor;

  final Color backgroundColor;

  final double internalWidgetWidth;

  final double buttonFontSize;

  final textManagement;

  const CardInputWidget({
    super.key,
    required this.buttonTextColor,
    required this.backgroundColor,
    required this.internalWidgetWidth,
    required this.buttonFontSize,
    this.textManagement,
  });

  @override
  State<CardInputWidget> createState() => _CardInputWidgetState();
}

class _CardInputWidgetState extends State<CardInputWidget> {
  final focusNode = FocusNode();
  final textInputController = TextEditingController();
  var isSelected = false;

  submitText(val) {
    isSelected = false;
    focusNode.unfocus();
    textInputController.clear();
    widget.textManagement.set(val);
  }

  initialsubmitText() {
    textInputController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    textInputController.dispose();
    focusNode.dispose();
  }

  @override
  void initState() {
    initialsubmitText();
    super.initState();

    focusNode.addListener(() async {
      if (focusNode.hasFocus) {
        isSelected = true;
      }
      if (!focusNode.hasFocus && isSelected) {
        focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: widget.backgroundColor,
        width: widget.internalWidgetWidth,
        height: widget.internalWidgetWidth * 0.15,
        child: TextFormField(
          maxLength: 100,
          textAlign: TextAlign.center,
          enableInteractiveSelection: false,
          controller: textInputController,
          focusNode: focusNode,
          style: TextStyle(
              fontSize: widget.buttonFontSize,
              color: widget.buttonTextColor,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Digite Seu Texto',
            counterText: "",
          ),
          validator: (userInput) {
            if (userInput != null && userInput.replaceAll(' ', '') != "") {
              return 'Valor Inválido';
            }
            return null;
          },
          onFieldSubmitted: (userInput) {
            submitText(userInput);
          },
        ),
      ),
    );
  }
}

/*input.value
            ? TextFormField(
                controller: myController,
                focusNode: focusNode,
                autofocus: true,

                /// Let as false for testing purposes
                obscureText: false,
                style: TextStyle(
                    fontSize: widget.buttonFontSize,
                    color: widget.buttonTextColor,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(border: InputBorder.none),
                validator: (value) {
                  if (value != null && value.replaceAll(' ', '') != "") {
                    return 'Valor Inválido';
                  }
                  return null;
                },
                onFieldSubmitted: _submitText(myController.text),
              )
            : Text(
                "Digite seu texto",
                style: TextStyle(
                    fontSize: widget.buttonFontSize,
                    color: widget.buttonTextColor,
                    fontWeight: FontWeight.bold),
              )*/
