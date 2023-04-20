import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;
  final void Function(int) onButtonPressed;
  final List<String> rotulos;

  NewNavBar(
      {required this.icons,
      required this.onButtonPressed,
      required this.rotulos});

  List<BottomNavigationBarItem> _buildNavBarItems() {
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
      items: _buildNavBarItems(),
    );
  }
}

class NewBody extends StatelessWidget {
  const NewBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text("La Fin Du Monde - Bock - 65 ibu"),
        ),
        Expanded(
          child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
        ),
        Expanded(
          child: Text("Duvel - Pilsner - 82 ibu"),
        ),
      ],
    );
  }
}

class NewAppBar extends AppBar {
  NewAppBar({super.key})
      : super(
          title: const Text("Dicas"),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => print("Pesquisando..."),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () => print("Favoritos..."),
            ),
          ],
        );
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: NewNavBar(
          icons: [Icons.home, Icons.favorite, Icons.add_a_photo],
          onButtonPressed: (index) => print("Tocaram no botão $index"),
          rotulos: ["Cafés", "Cervejas", "Nação"], //Label do ícone
        ),
      ),
    );
  }
}

void main() {
  MyApp app = const MyApp();
  runApp(app);
}
