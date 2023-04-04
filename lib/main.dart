import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: Text("Meu app")),
        body: Center(
            child: Column(children: [
          Text("Apenas começando..."),
          Text("No meio..."),
          Text("Terminando...")
        ])),
        bottomNavigationBar: Text("Botão 1"),
      ));

  runApp(app);
}
