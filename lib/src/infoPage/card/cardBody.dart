import 'package:flutter/material.dart';
import 'package:flutter_screen/src/infoPage/card/cardHeader/cardHeader.dart';

class CardBody extends StatefulWidget {
  final boxColor;
  final buttonTextColor;
  final internalWidgetWidth;
  final buttonFontSize;

  final textVal;
  final textManagement;

  final textEdit;
  final textEditVal;

  const CardBody({
    super.key,
    this.boxColor,
    this.buttonTextColor,
    this.internalWidgetWidth,
    this.buttonFontSize,
    this.textVal,
    this.textManagement,
    this.textEdit,
    this.textEditVal,
  });
  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  final focusNode = FocusNode();
  final textInputController = TextEditingController();

  submitEditedText(val) {
    widget.textEdit.set(false);
    widget.textManagement.set(val);
  }

  initialValue() {
    widget.textManagement.getText().then((value) => {
          if (value == null)
            {widget.textManagement.set('')}
          else
            {widget.textManagement.set(value)}
        });
  }

  @override
  void initState() {
    initialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(10, 50)),
      child: Container(
        color: widget.boxColor,
        width: widget.internalWidgetWidth,
        height: widget.internalWidgetWidth * 1.25,
        child: Column(
          children: [
            CardHeader(
              buttonTextColor: widget.buttonTextColor,
              textManagement: widget.textManagement,
              textEdit: widget.textEdit,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: widget.textEditVal
                  ? TextFormField(
                      initialValue: widget.textVal,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      enableInteractiveSelection: false,
                      focusNode: focusNode,
                      style: TextStyle(
                        fontSize: 30,
                        color: widget.buttonTextColor,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        border: InputBorder.none,
                      ),
                      validator: (userInput) {
                        if (userInput != null &&
                            userInput.replaceAll(' ', '') != "") {
                          return 'Valor Inválido';
                        }
                        return null;
                      },
                      onFieldSubmitted: (userInput) {
                        submitEditedText(userInput);
                      },
                    )
                  : Text(
                      widget.textVal ?? '',
                      style: TextStyle(fontSize: 30),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
