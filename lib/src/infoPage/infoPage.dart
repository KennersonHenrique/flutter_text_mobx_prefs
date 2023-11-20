import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screen/privacyPolicy/privacyPolicy.dart';
import 'package:flutter_screen/src/background/background.dart';
import 'package:flutter_screen/src/infoPage/card/cardBody.dart';
import 'package:flutter_screen/src/infoPage/card/cardInputWidget.dart';
import 'package:flutter_screen/src/infoPage/infoPageStateManagement.dart';

class InfoPage extends StatefulWidget {
  final internalWidgetWidth = 400.0;

  final textColor = Colors.black;

  final boxColor = Colors.white;

  final inputBoxRadius = BorderRadius.circular(12.0);

  final elementPadding = 40.0;

  final fontSize = 20.0;

  final bottomPadding = 150.0;

  final topPadding = 250.0;

  final textManagement = TextManagement();

  final textEdit = EditText();

  InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: Background(),
          ),
          Center(
            child: FittedBox(
              child: Observer(
                  builder: (_) => Column(
                        children: [
                          SizedBox(height: widget.topPadding),
                          CardBody(
                            boxColor: widget.boxColor,
                            buttonTextColor: widget.textColor,
                            internalWidgetWidth: widget.internalWidgetWidth,
                            textVal: widget.textManagement.value,
                            textManagement: widget.textManagement,
                            textEdit: widget.textEdit,
                            textEditVal: widget.textEdit.isEditable,
                          ),
                          SizedBox(height: widget.elementPadding),
                          CardInputWidget(
                              buttonTextColor: widget.textColor,
                              backgroundColor: widget.boxColor,
                              internalWidgetWidth: widget.internalWidgetWidth,
                              buttonFontSize: widget.fontSize,
                              textManagement: widget.textManagement),
                          SizedBox(height: widget.elementPadding * 2),
                          PrivacityPolicy(),
                          SizedBox(height: widget.bottomPadding),
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}



/*Column(
              children: [
                SizedBox(height: widget.topPadding),
                CardBody(
                  boxColor: widget.boxColor,
                  buttonTextColor: widget.textColor,
                  internalWidgetWidth: widget.internalWidgetWidth,
                ),
                SizedBox(height: widget.elementPadding),
                CardInputWidget(
                    buttonTextColor: widget.textColor,
                    contColor: widget.boxColor,
                    internalWidgetWidth: widget.internalWidgetWidth,
                    buttonFontSize: widget.fontSize),
                SizedBox(height: widget.elementPadding * 2),
                PrivacityPolicy(),
                SizedBox(height: widget.bottomPadding),
              ],
            )*/