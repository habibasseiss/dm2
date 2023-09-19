// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int x = 0; // variável de estado

  @override
  void initState() {
    super.initState();
    obtemValor(); // lê da memória hora que abre a página
  }

  void obtemValor() async {
    // busca um valor da memória persistente
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      x = prefs.getInt('contador') ?? 0;
    });
  }

  void salvaValor(int valor) async {
    // salva um valor na memória persistente
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('contador', valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(x.toString()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  x = x + 1;
                });
                salvaValor(x); // manda persistir o x
              },
              child: Text("Incrementar"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  x = x - 1;
                });
                salvaValor(x);
              },
              child: Text("Decrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
