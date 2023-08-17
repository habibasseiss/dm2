// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Curtir extends StatefulWidget {
  const Curtir({super.key});

  @override
  State<Curtir> createState() => _CurtirState();
}

class _CurtirState extends State<Curtir> {
  // uma variável declarada que vai controlar o estado
  bool curtiu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curtir"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 128,
              icon: curtiu == true
                ? Icon(Icons.favorite, color: Colors.pink)
                : Icon(Icons.favorite_outline, color: Colors.black),
              onPressed: () {
                setState(() {
                  curtiu = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
