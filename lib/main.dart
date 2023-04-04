import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(title: Text("Meu app")),
        body: Center(
            child: Column(children: [
          Text(
            "Apenas começando...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto",
              letterSpacing: 1.5,
              color: Colors.deepOrange,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            "Isso parece um link bem no seu meio",
            style: TextStyle(
              color: Colors.blue,
              backgroundColor: Colors.white,
              fontStyle: FontStyle.italic,
              wordSpacing: 5.0,
              height: 1.5,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationThickness: 2.0,
            ),
          ),
          Text(
            "THE END",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Georgia",
              letterSpacing: 3.5,
              color: Colors.indigo,
              decoration: TextDecoration.none,
            ),
          )
        ])),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 1"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 2"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 3"),
            ),
          ],
        ),
      ));

  runApp(app);
}
