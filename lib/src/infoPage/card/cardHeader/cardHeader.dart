import 'package:flutter/material.dart';
import 'package:flutter_screen/src/infoPage/card/cardHeader/cardDeleteWindow.dart';

class CardHeader extends StatelessWidget {
  final padding = 10.0;
  final buttonTextColor;
  final textManagement;
  final textEdit;

  const CardHeader(
      {super.key, this.buttonTextColor, this.textManagement, this.textEdit});

  void showCustomDialog(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return DeleteWindow(
          textManagement: textManagement,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              const Text(
                'Texto Digitado 1',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => {textEdit.set(true)},
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
                child: IconButton(
                    onPressed: () => showCustomDialog(context, 'hi'),
                    icon: Icon(
                      Icons.close,
                      color: buttonTextColor,
                    )),
              ),
              const Spacer(),
            ],
          ),
          const Divider(
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}
