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
      appBar: AppBar(
        title: Text("Cervejas"),
      ),
      body: DataTable(
        columns: [
          DataColumn(label: Text("Nome")),
          DataColumn(label: Text("Estilo")),
          DataColumn(label: Text("IBU")),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text("La Fin Du Monde")),
            DataCell(Text("Bock")),
            DataCell(Text("65")),
          ]),
          DataRow(cells: [
            DataCell(Text("Sapporo Premium")),
            DataCell(Text("Sour Ale")),
            DataCell(Text("54")),
          ]),
          DataRow(cells: [
            DataCell(Text("Duvel")),
            DataCell(Text("Pilsner")),
            DataCell(Text("82")),
          ]),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    ),
  );
  runApp(app);
}
