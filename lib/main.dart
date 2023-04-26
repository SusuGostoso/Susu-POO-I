import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  void carregar(index) {
    if (index == 0)
      carregarCafes();
    else if (index == 1)
      carregarCervejas();
    else if (index == 2) carregarNacoes();
  }

  void carregarCervejas() {
    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
      {"name": "Guinness Draught", "style": "Stout", "ibu": "45"},
      {"name": "Chimay Blue", "style": "Belgian Strong Dark Ale", "ibu": "30"}
    ];
  }

  void carregarCafes() {
    tableStateNotifier.value = [
      {"name": "Café Brasileiro", "style": "Brasil", "ibu": "Médio"},
      {"name": "Café Colombiano", "style": "Colômbia", "ibu": "Escuro"},
      {"name": "Café Etíope", "style": "Etiópia", "ibu": "Leve"},
      {"name": "Café Vietnamita", "style": "Vietnã", "ibu": "Forte"},
      {"name": "Café Jamaica Blue Mountain", "style": "Jamaica", "ibu": "Suave"}
    ];
  }

  void carregarNacoes() {
    tableStateNotifier.value = [
      {"name": "Brasil", "style": "América do Sul", "ibu": "210 milhões"},
      {"name": "Japão", "style": "Ásia", "ibu": "126 milhões"},
      {"name": "Espanha", "style": "Europa", "ibu": "47 milhões"},
      {"name": "Nigéria", "style": "África", "ibu": "211 milhões"},
      {
        "name": "Estados Unidos",
        "style": "América do Norte",
        "ibu": "332 milhões"
      }
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(
                    jsonObjects: value,
                    propertyNames: ["name", "style", "ibu"],
                    columnNames: ["Nome", "Estilo", "IBU"]);
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback; //esse atributo será uma função

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= () {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          dataService.carregar(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
