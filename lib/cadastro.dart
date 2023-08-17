// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final emailContorller = TextEditingController();

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
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              label: Text("Informe seu nome"),
              border: OutlineInputBorder(),
            ),
          ),
          
          SizedBox(height: 20),
          
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              label: Text("Informe seu email"),
              border: OutlineInputBorder(),
            ),
          ),
          
          SizedBox(height: 20),
          
          TextFormField(
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
                firstDate: DateTime(1900,1,1),
                lastDate: DateTime.now(),
                );
            },
          ),
          
          SizedBox(height: 20),
          
          ElevatedButton(
            onPressed: () {},
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
