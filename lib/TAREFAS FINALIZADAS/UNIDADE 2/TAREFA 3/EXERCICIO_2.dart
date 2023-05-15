import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:convert';

class DataService {
  static final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);

  final List<Function> _carregarFunctions = [
    carregarCafes,
    carregarCervejas,
    carregarNacoes,
  ];

  int selecionado = 1;

  static List<String> columnNames = [];
  static List<String> propertyNames = [];

  void carregar(index, {String size = '5'}) {
    _carregarFunctions[index](size: size);
    selecionado = index;
  }

  static Future<void> carregarCervejas({String size = '5'}) async {
    var cervejaUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': size});

    var jsonString = await http.read(cervejaUri);
    var cervejaJson = jsonDecode(jsonString) as List<dynamic>;
    for (var cerveja in cervejaJson) {
      cerveja['id'] = cerveja['id'].toString();
    }

    tableStateNotifier.value = cervejaJson;

    DataService.columnNames = [
      "ID",
      "UID",
      "brand",
      "Nome",
      "Estilo",
      "hop",
      "Fermentada",
      "Malte",
      "ibu",
      "alcohol",
      "blg"
    ];
    DataService.propertyNames = [
      "id",
      "uid",
      "brand",
      "name",
      "style",
      "hop",
      "yeast",
      "malts",
      "ibu",
      "alcohol",
      "blg"
    ];
  }

  static Future<void> carregarCafes({String size = '5'}) async {
    var cafeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': size});

    var jsonString = await http.read(cafeUri);
    var cafeJson = jsonDecode(jsonString) as List<dynamic>;
    for (var cafe in cafeJson) {
      cafe['id'] = cafe['id'].toString();
    }

    tableStateNotifier.value = cafeJson;

    DataService.columnNames = [
      "ID",
      "UID",
      "Blend",
      "Origem",
      "Variedade",
      "Notas",
      "Intensidade"
    ];
    DataService.propertyNames = [
      "id",
      "uid",
      "blend_name",
      "origin",
      "variety",
      "notes",
      "intensifier"
    ];
  }

  static Future<void> carregarNacoes({String size = '5'}) async {
    var nacoesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': size});

    var jsonString = await http.read(nacoesUri);
    var nacoesJson = jsonDecode(jsonString) as List<dynamic>;
    for (var nacoes in nacoesJson) {
      nacoes['id'] = nacoes['id'].toString();
    }

    tableStateNotifier.value = nacoesJson;

    DataService.columnNames = [
      "ID",
      "UID",
      "Nacionalidade",
      "Idioma",
      "Capital",
      "Esporte nacional",
      "Bandeira"
    ];
    DataService.propertyNames = [
      "id",
      "uid",
      "nationality",
      "language",
      "capital",
      "national_sport",
      "flag"
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();
  runApp(app);

  dataService.carregar(1);
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
            actions: const [
              TamanhoDropdown(),
            ],
          ),
          body: Container(
            width:
                2000, //coloquei 2000 pra ver se aparecia o scroll horizontal    -double.infinity
            margin: const EdgeInsets.symmetric(horizontal: 10.0), //Margem

            child: SingleChildScrollView(
              //Scroll
              scrollDirection: Axis.horizontal, //scroll setado como horizontal
              child: ValueListenableBuilder(
                  valueListenable: DataService.tableStateNotifier,
                  builder: (_, value, __) {
                    return DataTableWidget(
                        jsonObjects: value,
                        propertyNames: DataService.propertyNames,
                        columnNames: DataService.columnNames);
                  }),
            ),
          ),
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
            activeIcon: Icon(Icons.coffee)),
        BottomNavigationBarItem(
            label: "Cervejas",
            icon: Icon(Icons.local_drink_outlined),
            activeIcon: Icon(Icons.local_drink)),
        BottomNavigationBarItem(
            label: "Nações",
            icon: Icon(Icons.flag_outlined),
            activeIcon: Icon(Icons.flag)),
      ],

      backgroundColor: Colors.deepPurple,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      elevation: 5,
      selectedFontSize: 18,
      unselectedFontSize: 14,
      // Nova opção de tamanho para selecionar a quantidade a ser carregada
    );
  }
}

class TamanhoDropdown extends StatefulWidget {
  const TamanhoDropdown({Key? key}) : super(key: key);

  @override
  _TamanhoDropdownState createState() => _TamanhoDropdownState();
}

class _TamanhoDropdownState extends State<TamanhoDropdown> {
  String _tamanhoSelecionado = "5"; // valor padrão selecionado

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _tamanhoSelecionado,
      items: <String>["5", "10", "15"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _tamanhoSelecionado = newValue;
          });
          dataService.carregar(dataService.selecionado,
              size: _tamanhoSelecionado);
        }
      },
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const ["Nome", "Estilo", "IBU"],
    this.propertyNames = const ["name", "style", "ibu"],
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames
          .map(
            (name) => DataColumn(
              label: Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects.map(
        (obj) {
          return DataRow(
            cells: propertyNames
                .map(
                  (propName) => DataCell(
                    Text(obj[propName]),
                  ),
                )
                .toList(),
          );
        },
      ).toList(),
    );
  }
}
