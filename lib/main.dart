import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;
  final void Function(int) onButtonPressed;
  final List<String> rotulos;

  NewNavBar(
      {required this.icons,
      required this.onButtonPressed,
      required this.rotulos});

  List<BottomNavigationBarItem> construirNavBar() {
    return icons
        .map((icon) => BottomNavigationBarItem(
              icon: Icon(icon),
              label: rotulos[icons.indexOf(icon)],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onButtonPressed,
      items: construirNavBar(),
    );
  }
}

class NewBode extends StatelessWidget {
  List<String> objects;
  NewBode({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}

class NewAppBar extends AppBar {
  NewAppBar({super.key}) : super(title: const Text("Dicas"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: NewAppBar(),
        body: NewBode(objects: [
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),
        bottomNavigationBar: NewNavBar(
          icons: const [
            Icons.coffee_outlined,
            Icons.local_drink_outlined,
            Icons.flag_outlined
          ],
          onButtonPressed: (index) => print("Tocaram no botão $index"),
          rotulos: const ["Cafés", "Cervejas", "Nações"], //Label do ícone
        ),
      ),
    );
  }
}

void main() {
  MyApp app = const MyApp();
  runApp(app);
}
