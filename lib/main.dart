// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const PaginaInicial());
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String x = "100";
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(x),
            ElevatedButton(
              onPressed: () {
                // AO PRESSIONAR O BOTAO
                print("Antes de zerar");
                print(x);
                x = "0";
                print("Depois de zerar");
                print(x);
              },
              child: Text("Zerar"),
            ),
          ],
        ),
      ),
    );
  }
}
