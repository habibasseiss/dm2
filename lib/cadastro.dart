// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obtemDados();
  }

  void salvaDados() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nome', nomeController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('senha', senhaController.text);
  }

  void obtemDados() async {
    final prefs = await SharedPreferences.getInstance();
    nomeController.text = prefs.getString('nome') ?? '';
    emailController.text = prefs.getString('email') ?? '';
    senhaController.text = prefs.getString('senha') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              label: Text("Informe seu nome"),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              label: Text("Informe seu email"),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: senhaController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              label: Text("Informe sua senha"),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.today),
              label: Text("Informe sua data de nascimento"),
              border: OutlineInputBorder(),
            ),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900, 1, 1),
                lastDate: DateTime.now(),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              print("O botão salvar foi clicado");
              print(nomeController.text);
              print(emailController.text);
              print(senhaController.text);
              salvaDados();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}
