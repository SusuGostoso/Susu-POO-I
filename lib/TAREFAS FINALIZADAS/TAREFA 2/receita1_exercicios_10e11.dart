import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cervejas',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 25.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cervejas"),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 50.0,
              horizontalMargin: 0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Nome',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Estilo',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'IBU',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('La Fin Du Monde')),
                    DataCell(Text('Bock')),
                    DataCell(Text('65')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sapporo Premium')),
                    DataCell(Text('Sour Ale')),
                    DataCell(Text('54')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Duvel')),
                    DataCell(Text('Pilsner')),
                    DataCell(Text('82')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Stella Artois')),
                    DataCell(Text('Pale Lager')),
                    DataCell(Text('30')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Guinness')),
                    DataCell(Text('Irish Dry Stout')),
                    DataCell(Text('45')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Paulaner Hefe-Weissbier')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('14')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Chimay Rouge')),
                    DataCell(Text('Belgian Dubbel')),
                    DataCell(Text('20')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Saison Dupont')),
                    DataCell(Text('Saison')),
                    DataCell(Text('25')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Weihenstephaner Vitus')),
                    DataCell(Text('Weizenbock')),
                    DataCell(Text('30')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Franziskaner Hefe-Weisse')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('15')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Franziskaner Hefe-Weisse')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('15')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Franziskaner Hefe-Weisse')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('15')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Franziskaner Hefe-Weisse')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('15')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Franziskaner Hefe-Weisse')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('15')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Franziskaner Hefe-Weisse')),
                    DataCell(Text('Hefeweizen')),
                    DataCell(Text('15')),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.greenAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context, "Apertou é gay",
                      "Você gostaria de me dar?", "Óbvio", "Claro");
                },
                child: const Text("Não aperte"),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                iconSize: 48,
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context, "Corno detectado",
                      "Você parou de ser corno?", "Sim", "Não");
                },
                child: const Text("MagicButton"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showAlertDialog(BuildContext context, String title,
    String message, String b1, String b2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(b1),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(b2),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
// --- Button Widget --- //
