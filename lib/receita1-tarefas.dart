import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 25.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
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
          ),
          FadeInImage(
            placeholder: AssetImage('images/carregando.gif'),
            image: NetworkImage(
                'https://i.ibb.co/KXjpnSn/8a0acf9f-376d-4312-ab12-bc74eacfcf0f.webp'),
            width: 200,
            height: 200,
            fadeInDuration: Duration(milliseconds: 1000),
            fadeOutDuration: Duration(milliseconds: 1000),
          ),
        ])),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, //Se eu usar o "MainAxisAlignment.center", eles ficam centralizados, mas não distribuídos da forma que eu prefiro.
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Botão 1"),
            ),
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 48,
              onPressed: () {},
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
