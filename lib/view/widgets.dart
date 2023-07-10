import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Dicas"), actions: [
            PopupMenuButton(
              itemBuilder: (_) => [3, 7, 15]
                  .map((num) => PopupMenuItem(
                        value: num,
                        child: Text("Carregar $num itens por vez"),
                      ))
                  .toList(),
              onSelected: (number) {
                dataService.numberOfItems = number;
              },
            )
          ]),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return Center(child: Text("Toque em algum botão"));
                  case TableStatus.loading:
                    return Center(child: CircularProgressIndicator());
                  case TableStatus.ready:
                    return SingleChildScrollView(
                        child: DataTableWidget(
                      jsonObjects: value['dataObjects'],
                      propertyNames: value['propertyNames'],
                      columnNames: value['columnNames'],
                      sortCallback: dataService.ordenarEstadoAtual,
                    ));
                  case TableStatus.error:
                    return Text("Lascou");
                }
                return Text("...");
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;
  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          _itemSelectedCallback(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: state.value,
        items: [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
            label: "Cervejas",
            icon: Icon(Icons.local_drink_outlined),
          ),
          BottomNavigationBarItem(
            label: "Sistemas",
            icon: Icon(Icons.computer),
          ),
          BottomNavigationBarItem(
            label: "Nações",
            icon: Icon(Icons.flag_outlined),
          ),
        ]);
  }
}

void _empty(String, bool) {}

class DataTableWidget extends StatelessWidget {
  final _sortCallback;
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const [],
      this.propertyNames = const [],
      sortCallback})
      : _sortCallback = sortCallback ?? _empty;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                onSort: (columnIndex, ascending) =>
                    _sortCallback(propertyNames[columnIndex], ascending)
                //dataService.ordenarEstadoAtual(propertyNames[columnIndex]),
                ,
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
