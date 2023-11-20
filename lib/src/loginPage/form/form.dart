import 'package:flutter/material.dart';
import 'package:flutter_screen/privacyPolicy/privacyPolicy.dart';
import 'package:flutter_screen/src/loginPage/form/passwordField.dart';
import 'package:flutter_screen/src/loginPage/form/userField.dart';
import 'package:flutter_screen/src/loginPage/loginMethod.dart';

class AppForm extends StatefulWidget {
  const AppForm({super.key});

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final topPadding = 250.0;

  final inputBoxWidth = 400.0;

  final inputBoxColor = Colors.white;

  final inputBoxRadius = BorderRadius.circular(12.0);

  final inputBoxPadding = 75.0;

  final buttonColor = Colors.green.shade300;

  final buttonSize = Size(200.0, 0.0);

  final buttonFontSize = 25.0;

  final buttonTextColor = Colors.white;

  final labelColor = Colors.white;

  final labelFontSize = 20.0;

  final labelSpacing = 10.0;

  final bottomPadding = 150.0;

  final url = 'https://www.google.com';

  final _formKey = GlobalKey<FormState>();

  final TextEditingController userController = TextEditingController();
  final TextEditingController passWController = TextEditingController();

  void login(BuildContext context, String user, String passw) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Login(
          user: user,
          pass: passw,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: topPadding),
          UserForm(
            inputBoxColor: inputBoxColor,
            inputBoxWidth: inputBoxWidth,
            inputBoxRadius: inputBoxRadius,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            userController: userController,
          ),
          SizedBox(height: inputBoxPadding),
          PasswordField(
            inputBoxColor: inputBoxColor,
            inputBoxWidth: inputBoxWidth,
            inputBoxRadius: inputBoxRadius,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            passWController: passWController,
          ),
          SizedBox(height: inputBoxPadding),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20.0),
              backgroundColor: buttonColor,
              minimumSize: buttonSize,
              shadowColor: Colors.black,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                login(context, userController.text, passWController.text);
              }
            },
            child: Text(
              "Entrar",
              style:
                  TextStyle(fontSize: buttonFontSize, color: buttonTextColor),
            ),
          ),
          SizedBox(height: bottomPadding),
          PrivacityPolicy(),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}
