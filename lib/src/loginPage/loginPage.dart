import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screen/src/background/background.dart';
import 'package:flutter_screen/src/loginPage/form/form.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: Background(),
          ),
          Center(
            child: FittedBox(
              child: SafeArea(
                child: AppForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/*Center(
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: topPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Usuário",
                    style:
                        TextStyle(color: Colors.white, fontSize: labelFontSize),
                  ),
                  SizedBox(height: labelSpacing),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: inputBoxRadius,
                      color: inputBoxColor,
                    ),
                    width: inputBoxWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
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
              ),
              SizedBox(height: inputBoxPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Senha",
                    style:
                        TextStyle(color: Colors.white, fontSize: labelFontSize),
                  ),
                  SizedBox(height: labelSpacing),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: inputBoxRadius,
                      color: inputBoxColor,
                    ),
                    width: inputBoxWidth,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9a-zA-Z]")),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      // The validator receives the text that the user has entered.
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
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    /*
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );*/
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const infoCap()),
                    );
                  }
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(
                      fontSize: buttonFontSize, color: buttonTextColor),
                ),
              ),
              SizedBox(height: bottomPadding),
              InkWell(
                  child: Text(
                    "Política de privacidade",
                    style: TextStyle(
                      color: buttonTextColor,
                      fontSize: labelFontSize,
                    ),
                  ),
                  onTap: () =>
                      launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)),
              SizedBox(height: bottomPadding),
            ],
          ),
        ),
      ),
    );*/