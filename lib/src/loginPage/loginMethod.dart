import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screen/src/infoPage/infoPage.dart';
import 'package:flutter_screen/src/loginPage/model/user.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  final user;
  final pass;

  const Login({super.key, this.user, this.pass});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Future<User> userList;
//  for testing purposes
// user :: userName9
// pass :: password9
  Future<User> getUser() async {
    final response = await http.get(Uri.parse(
        'https://655a708e6981238d054d7f1d.mockapi.io/user?userName=${widget.user}'));
    final response2 = await http.get(Uri.parse(
        'https://655a708e6981238d054d7f1d.mockapi.io/user?password=${widget.pass}'));

    if (response.statusCode == 200) {
      final userResp =
          User.fromJson(jsonDecode(response.body)[0] as Map<String, dynamic>);

      final passResp =
          User.fromJson(jsonDecode(response2.body)[0] as Map<String, dynamic>);

      if (passResp.id == userResp.id) {
        Timer(const Duration(seconds: 2), () {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InfoPage()));
        });
        return User.fromJson(
            jsonDecode(response.body)[0] as Map<String, dynamic>);
      } else {
        throw Exception('Credenciais incorretas');
      }
    } else {
      throw Exception('Erro: impossivel conectar-se ao servidor');
    }
  }

  @override
  void initState() {
    super.initState();
    userList = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconColor: Colors.white,
      title: const Text('Login'),
      actions: <Widget>[
        FutureBuilder<User>(
          future: userList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  'Bem vindo ${snapshot.data!.user}, o aplicativo sera aberto em breve');
            } else if (snapshot.error.toString().contains('ClientException')) {
              return Column(
                children: [
                  const Text('Não foi possivel alcançar o servidor'),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Voltar'),
                  )
                ],
              );
            } else if (snapshot.error.toString().contains('RangeError')) {
              return Column(
                children: [
                  const Text('Credenciais erradas'),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Voltar'),
                  )
                ],
              );
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
